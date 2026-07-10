import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:peer/peer_connection.dart';
import 'package:peer/src/data/peer_connection_service_impl.dart';

import 'support/peer_service_test_fakes.dart';

void main() {
  const PeerDevice device = PeerDevice(id: 'device-1', name: 'Player', isOurApp: true);
  const PeerEndpoint remoteEndpoint = PeerEndpoint(
    identity: PeerIdentity(id: 'peer-1', displayName: 'Remote'),
    device: device,
  );
  const PeerPlayerIdentity playerIdentity = PeerPlayerIdentity(id: 'local-1', displayName: 'Neo');

  group('PeerConnectionServiceImpl', () {
    late FakePeerServerSessionRepository serverRepository;
    late FakePeerClientSessionRepository clientRepository;
    late FakePeerTransportRepository transportRepository;
    late FakePeerPlayerIdentitySource identitySource;
    late FakePeerBleSessionGuard bleSessionGuard;
    late PeerConnectionServiceImpl service;
    late StreamSubscription<AppConnectionFrame> framesSubscription;
    final List<AppConnectionFrame> frames = <AppConnectionFrame>[];

    setUp(() {
      frames.clear();
      serverRepository = FakePeerServerSessionRepository();
      clientRepository = FakePeerClientSessionRepository();
      transportRepository = FakePeerTransportRepository();
      identitySource = FakePeerPlayerIdentitySource()..identity = playerIdentity;
      bleSessionGuard = FakePeerBleSessionGuard();

      service = PeerConnectionServiceImpl(
        serverRepository,
        clientRepository,
        transportRepository,
        identitySource,
        bleSessionGuard,
      );
      framesSubscription = service.frames.listen(frames.add);
    });

    tearDown(() async {
      await framesSubscription.cancel();
      await service.dispose();
      await clientRepository.dispose();
      await transportRepository.close();
    });

    Future<void> drainQueue() => Future<void>.delayed(Duration.zero);

    test('openRoleSelection emits role selection frame', () async {
      await service.openRoleSelection();
      await drainQueue();

      expect(frames.last.state.overlay.phase, OverlayPhase.roleSelection);
    });

    test('startHostSession without profile does not start advertising', () async {
      identitySource.identity = null;

      await service.startHostSession();
      await drainQueue();

      expect(serverRepository.startAdvertisingCalls, 0);
      expect(frames, isEmpty);
    });

    test('startHostSession with profile starts host advertising', () async {
      await service.startHostSession();
      await drainQueue();

      expect(serverRepository.startAdvertisingCalls, 1);
      expect(frames.last.state.overlay.phase, OverlayPhase.hostAdvertising);
      expect(frames.last.state.overlay.role, PeerRole.server);
    });

    test('startClientSession with profile starts client discovery', () async {
      await service.startClientSession();
      await drainQueue();

      expect(clientRepository.startDiscoveryCalls, 1);
      expect(frames.last.state.overlay.phase, OverlayPhase.clientDiscovering);
      expect(frames.last.state.overlay.role, PeerRole.client);
    });

    test('discovery updates merge devices into overlay frame', () async {
      await service.startClientSession();
      clientRepository.emitDiscoveredDevices(<PeerDevice>[device]);
      await drainQueue();

      expect(frames.last.state.overlay.devices, <PeerDevice>[device]);
    });

    test('session invitation moves host to invitation decision', () async {
      await service.startHostSession();
      transportRepository.emitSessionMessage(const PeerInvitation(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      expect(frames.last.state.overlay.phase, OverlayPhase.hostInvitationDecision);
      expect(frames.last.state.overlay.pendingInvitation, remoteEndpoint);
    });

    test('transport connected emits connected frame with close overlay event', () async {
      await service.startHostSession();
      transportRepository.emitConnectionState(const PeerConnected(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      expect(frames.last.state.shared.isConnected, isTrue);
      expect(frames.last.state.shared.remoteDisplayName, 'Remote');
      expect(frames.last.criticalEvents, isNotEmpty);
      expect(frames.last.criticalEvents.first, isA<PeerUiCloseOverlayEvent>());
    });

    test('inviteDevice connects to highlighted discovered device', () async {
      await service.startClientSession();
      clientRepository.emitDiscoveredDevices(<PeerDevice>[device]);
      await drainQueue();

      await service.inviteDevice(deviceId: device.id);
      await drainQueue();

      expect(clientRepository.connectToDeviceCalls, 1);
      expect(clientRepository.lastConnectedDevice, device);
      expect(frames.last.state.overlay.phase, OverlayPhase.clientInviting);
    });

    test('inviteDevice throws when device is not discovered', () async {
      await service.startClientSession();
      await drainQueue();

      await expectLater(service.inviteDevice(deviceId: 'missing'), throwsA(isA<StateError>()));
    });

    test('closeSession dismisses overlay without tearing down connected transport path', () async {
      await service.startHostSession();
      transportRepository.emitConnectionState(const PeerConnected(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      final int framesBeforeClose = frames.length;

      await service.closeSession(
        origin: PeerSessionCloseOrigin.user,
        reason: PeerSessionCloseReason.userDismissedOverlay,
      );
      await drainQueue();

      expect(frames.length, greaterThan(framesBeforeClose));
      expect(frames.last.criticalEvents, isNotEmpty);
      expect(frames.last.state.shared.isConnected, isTrue);
    });

    test('transport connected activates ble session guard', () async {
      await service.startHostSession();
      transportRepository.emitConnectionState(const PeerConnected(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      expect(bleSessionGuard.activateCalls, 1);
    });

    test('advertising failure dispatches bluetooth unavailable error frame', () async {
      serverRepository.shouldFailStartAdvertising = true;

      await service.startHostSession();
      await drainQueue();

      expect(frames.last.state.overlay.phase, OverlayPhase.error);
      expect(frames.last.state.overlay.errorKind, PeerSessionErrorKind.bluetoothUnavailable);
    });

    test('retryLastSession without profile is a no-op', () async {
      identitySource.identity = null;

      await service.retryLastSession();
      await drainQueue();

      expect(serverRepository.startAdvertisingCalls, 0);
      expect(clientRepository.startDiscoveryCalls, 0);
      expect(frames, isEmpty);
    });

    test('retryLastSession without role opens role selection', () async {
      await service.retryLastSession();
      await drainQueue();

      expect(frames.last.state.overlay.phase, OverlayPhase.roleSelection);
    });

    test('retryLastSession restarts host session', () async {
      await service.startHostSession();
      await drainQueue();

      await service.retryLastSession();
      await drainQueue();

      expect(serverRepository.startAdvertisingCalls, 2);
      expect(frames.last.state.overlay.phase, OverlayPhase.hostAdvertising);
    });

    test('retryLastSession restarts client session', () async {
      await service.startClientSession();
      await drainQueue();

      await service.retryLastSession();
      await drainQueue();

      expect(clientRepository.startDiscoveryCalls, 2);
      expect(frames.last.state.overlay.phase, OverlayPhase.clientDiscovering);
    });

    test('onAppResumed refreshes discovery in client phases', () async {
      await service.startClientSession();
      await drainQueue();

      await service.onAppResumed();
      await drainQueue();

      expect(clientRepository.refreshDiscoveryCalls, 1);
    });

    test('onAppResumed ignores non-client phases', () async {
      await service.startHostSession();
      await drainQueue();

      await service.onAppResumed();
      await drainQueue();

      expect(clientRepository.refreshDiscoveryCalls, 0);
    });

    test('transport disconnect deactivates ble session guard', () async {
      await service.startHostSession();
      transportRepository.emitConnectionState(const PeerConnected(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      transportRepository.emitDisconnectReason(PeerDisconnectReason.linkLost);
      await drainQueue();

      expect(bleSessionGuard.deactivateCalls, greaterThanOrEqualTo(1));
    });

    test('acceptInvitation resumes host advertising after invitation decision', () async {
      await service.startHostSession();
      transportRepository.emitSessionMessage(const PeerInvitation(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      await service.acceptInvitation();
      await drainQueue();

      expect(serverRepository.acceptInvitationCalls, 1);
      expect(frames.last.state.overlay.phase, OverlayPhase.hostAdvertising);
    });

    test('rejectInvitation resumes host advertising after invitation decision', () async {
      await service.startHostSession();
      transportRepository.emitSessionMessage(const PeerInvitation(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      await service.rejectInvitation();
      await drainQueue();

      expect(serverRepository.rejectInvitationCalls, 1);
      expect(frames.last.state.overlay.phase, OverlayPhase.hostAdvertising);
    });

    test('closeSession with userDisconnect tears down ble without overlay dismiss frame', () async {
      await service.startHostSession();
      transportRepository.emitConnectionState(const PeerConnected(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      final int framesBeforeClose = frames.length;

      await service.closeSession(
        origin: PeerSessionCloseOrigin.user,
        reason: PeerSessionCloseReason.userDisconnect,
      );
      await drainQueue();

      expect(frames.length, framesBeforeClose);
      expect(bleSessionGuard.deactivateCalls, greaterThanOrEqualTo(1));
      expect(serverRepository.releaseSessionCalls, greaterThanOrEqualTo(1));
    });

    test('session rejection returns client to discovering with toast', () async {
      await service.startClientSession();
      clientRepository.emitDiscoveredDevices(<PeerDevice>[device]);
      await drainQueue();

      await service.inviteDevice(deviceId: device.id);
      await drainQueue();

      transportRepository.emitSessionMessage(const PeerRejection(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      expect(frames.last.state.overlay.phase, OverlayPhase.clientDiscovering);
      expect(
        frames.last.softEvents,
        contains(
          isA<PeerUiShowToastEvent>().having(
            (PeerUiShowToastEvent event) => event.kind,
            'kind',
            PeerToastKind.invitationRejected,
          ),
        ),
      );
    });

    test('discovery failure dispatches discovery failed error frame', () async {
      clientRepository.shouldFailStartDiscovery = true;

      await service.startClientSession();
      await drainQueue();

      expect(frames.last.state.overlay.phase, OverlayPhase.error);
      expect(frames.last.state.overlay.errorKind, PeerSessionErrorKind.discoveryFailed);
    });

    test('acceptInvitation failure dispatches connection failed error frame', () async {
      await service.startHostSession();
      transportRepository.emitSessionMessage(const PeerInvitation(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      serverRepository.shouldFailAcceptInvitation = true;

      await service.acceptInvitation();
      await drainQueue();

      expect(serverRepository.acceptInvitationCalls, 0);
      expect(frames.last.state.overlay.phase, OverlayPhase.error);
      expect(frames.last.state.overlay.errorKind, PeerSessionErrorKind.connectionFailed);
    });

    test(
      'inviteDevice dispatches connection failed after connect retries exhausted',
      () async {
        await service.startClientSession();
        clientRepository.emitDiscoveredDevices(<PeerDevice>[device]);
        await drainQueue();

        clientRepository.shouldFailConnect = true;

        await service.inviteDevice(deviceId: device.id);
        await Future<void>.delayed(const Duration(seconds: 3));
        await drainQueue();

        expect(clientRepository.connectToDeviceCalls, 2);
        expect(frames.last.state.overlay.phase, OverlayPhase.error);
        expect(frames.last.state.overlay.errorKind, PeerSessionErrorKind.connectionFailed);
      },
      timeout: const Timeout(Duration(seconds: 10)),
    );

    test('inviteDevice retries connect before succeeding', () async {
      await service.startClientSession();
      clientRepository.emitDiscoveredDevices(<PeerDevice>[device]);
      await drainQueue();

      clientRepository.connectFailuresBeforeSuccess = 1;

      await service.inviteDevice(deviceId: device.id);
      await Future<void>.delayed(const Duration(seconds: 3));
      await drainQueue();

      expect(clientRepository.connectToDeviceCalls, 2);
      expect(frames.last.state.overlay.phase, OverlayPhase.clientInviting);
    }, timeout: const Timeout(Duration(seconds: 10)));

    test('session acceptance is ignored by reduce state machine', () async {
      await service.startHostSession();
      transportRepository.emitSessionMessage(const PeerInvitation(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      final int framesBeforeAccept = frames.length;

      transportRepository.emitSessionMessage(const PeerAcceptance(remoteEndpoint: remoteEndpoint));
      await drainQueue();

      expect(frames.length, framesBeforeAccept);
    });
  });
}
