import 'package:flutter_test/flutter_test.dart';
import 'package:peer/peer_connection.dart';

void main() {
  const PeerDevice device = PeerDevice(id: 'device-1', name: 'Player', isOurApp: true);
  const PeerEndpoint remoteEndpoint = PeerEndpoint(
    identity: PeerIdentity(id: 'peer-1', displayName: 'Remote'),
    device: device,
  );

  group('reduce', () {
    test('CmdOpenRoleSelection moves idle snapshot to role selection', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot();

      final ReduceResult result = reduce(prev: prev, command: const CmdOpenRoleSelection());

      expect(result.next.phase, PeerSessionCorePhase.roleSelection);
      expect(result.rawEvents, isEmpty);
    });

    test('CmdOpenRoleSelection is ignored when already connected', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.connected,
        sessionId: 'session-1',
      );

      final ReduceResult result = reduce(prev: prev, command: const CmdOpenRoleSelection());

      expect(result.next, prev);
      expect(result.rawEvents, isEmpty);
    });

    test('CmdStartHostSession starts host advertising', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot();

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdStartHostSession(sessionId: 'host-session'),
      );

      expect(result.next.sessionId, 'host-session');
      expect(result.next.phase, PeerSessionCorePhase.hostAdvertising);
      expect(result.next.role, PeerRole.server);
    });

    test('CmdInviteDevice moves client to inviting when device exists', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        sessionId: 'client-session',
        phase: PeerSessionCorePhase.clientDiscovering,
        role: PeerRole.client,
        discoveredDevices: <PeerDevice>[device],
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: CmdInviteDevice(deviceId: device.id),
      );

      expect(result.next.phase, PeerSessionCorePhase.clientInviting);
      expect(result.next.invitedDeviceId, device.id);
    });

    test('CmdInviteDevice is ignored for unknown device', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.clientDiscovering,
        role: PeerRole.client,
        discoveredDevices: <PeerDevice>[device],
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdInviteDevice(deviceId: 'missing'),
      );

      expect(result.next, prev);
    });

    test('CmdTransportConnected closes overlay and stores remote endpoint', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        sessionId: 'session-1',
        phase: PeerSessionCorePhase.clientInviting,
        role: PeerRole.client,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdTransportConnected(remoteEndpoint: remoteEndpoint),
      );

      expect(result.next.phase, PeerSessionCorePhase.connected);
      expect(result.next.remoteEndpoint, remoteEndpoint);
      expect(result.rawEvents, contains(isA<RawCloseOverlayEvent>()));
    });

    test('CmdCloseSession on connected overlay dismiss only closes overlay', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(phase: PeerSessionCorePhase.connected);

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdCloseSession(
          origin: PeerSessionCloseOrigin.user,
          reason: PeerSessionCloseReason.userDismissedOverlay,
        ),
      );

      expect(result.next, prev);
      expect(result.rawEvents, contains(isA<RawCloseOverlayEvent>()));
    });

    test('CmdTransportDisconnected resets session and emits toast for link loss', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.connected,
        remoteEndpoint: remoteEndpoint,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdTransportDisconnected(reason: PeerDisconnectReason.linkLost),
      );

      expect(result.next, const PeerSessionSnapshot());
      expect(
        result.rawEvents,
        contains(
          isA<RawShowToastEvent>().having(
            (RawShowToastEvent event) => event.kind,
            'kind',
            PeerToastKind.linkLost,
          ),
        ),
      );
    });

    test('CmdBleError moves snapshot to error phase with toast', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.clientDiscovering,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdBleError(errorKind: PeerSessionErrorKind.discoveryFailed),
      );

      expect(result.next.phase, PeerSessionCorePhase.error);
      expect(result.next.errorKind, PeerSessionErrorKind.discoveryFailed);
      expect(
        result.rawEvents,
        contains(
          isA<RawShowToastEvent>().having(
            (RawShowToastEvent event) => event.kind,
            'kind',
            PeerToastKind.discoveryFailed,
          ),
        ),
      );
    });

    test('CmdStartClientSession starts client discovery', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot();

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdStartClientSession(sessionId: 'client-session'),
      );

      expect(result.next.sessionId, 'client-session');
      expect(result.next.phase, PeerSessionCorePhase.clientDiscovering);
      expect(result.next.role, PeerRole.client);
    });

    test('CmdAcceptInvitation resumes host advertising from invitation decision', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.hostInvitationDecision,
        role: PeerRole.server,
        pendingInvitation: remoteEndpoint,
      );

      final ReduceResult result = reduce(prev: prev, command: const CmdAcceptInvitation());

      expect(result.next.phase, PeerSessionCorePhase.hostAdvertising);
      expect(result.next.pendingInvitation, isNull);
    });

    test('CmdAcceptInvitation is ignored outside invitation decision', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.hostAdvertising,
        role: PeerRole.server,
      );

      final ReduceResult result = reduce(prev: prev, command: const CmdAcceptInvitation());

      expect(result.next, prev);
    });

    test('CmdRejectInvitation resumes host advertising from invitation decision', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.hostInvitationDecision,
        role: PeerRole.server,
        pendingInvitation: remoteEndpoint,
      );

      final ReduceResult result = reduce(prev: prev, command: const CmdRejectInvitation());

      expect(result.next.phase, PeerSessionCorePhase.hostAdvertising);
      expect(result.next.pendingInvitation, isNull);
    });

    test('CmdInvitationReceived moves host to invitation decision', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.hostAdvertising,
        role: PeerRole.server,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdInvitationReceived(remoteEndpoint: remoteEndpoint),
      );

      expect(result.next.phase, PeerSessionCorePhase.hostInvitationDecision);
      expect(result.next.pendingInvitation, remoteEndpoint);
    });

    test('CmdInvitationReceived is ignored outside host advertising', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.clientDiscovering,
        role: PeerRole.client,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdInvitationReceived(remoteEndpoint: remoteEndpoint),
      );

      expect(result.next, prev);
    });

    test('CmdInvitationRejected returns client to discovering with toast', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.clientInviting,
        role: PeerRole.client,
        invitedDeviceId: 'device-1',
      );

      final ReduceResult result = reduce(prev: prev, command: const CmdInvitationRejected());

      expect(result.next.phase, PeerSessionCorePhase.clientDiscovering);
      expect(result.next.invitedDeviceId, isNull);
      expect(
        result.rawEvents,
        contains(
          isA<RawShowToastEvent>().having(
            (RawShowToastEvent event) => event.kind,
            'kind',
            PeerToastKind.invitationRejected,
          ),
        ),
      );
    });

    test('CmdDiscoveryUpdated replaces discovered devices in client phases', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.clientDiscovering,
        role: PeerRole.client,
      );
      const List<PeerDevice> devices = <PeerDevice>[device];

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdDiscoveryUpdated(devices: devices),
      );

      expect(result.next.discoveredDevices, devices);
    });

    test('CmdDiscoveryUpdated is ignored outside client discovery phases', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.hostAdvertising,
        role: PeerRole.server,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdDiscoveryUpdated(devices: <PeerDevice>[device]),
      );

      expect(result.next, prev);
    });

    test('CmdCloseSession resets snapshot when not connected overlay dismiss', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        sessionId: 'session-1',
        phase: PeerSessionCorePhase.clientDiscovering,
        role: PeerRole.client,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdCloseSession(
          origin: PeerSessionCloseOrigin.user,
          reason: PeerSessionCloseReason.userDisconnect,
        ),
      );

      expect(result.next, const PeerSessionSnapshot());
      expect(result.rawEvents, contains(isA<RawCloseOverlayEvent>()));
    });

    test('CmdTransportDisconnected ignores disconnect outside connected phase', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.clientDiscovering,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdTransportDisconnected(reason: PeerDisconnectReason.linkLost),
      );

      expect(result.next, prev);
      expect(result.rawEvents, isEmpty);
    });

    test('CmdTransportDisconnected emits peer disconnect toast', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.connected,
        remoteEndpoint: remoteEndpoint,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdTransportDisconnected(reason: PeerDisconnectReason.peerDisconnect),
      );

      expect(result.next, const PeerSessionSnapshot());
      expect(
        result.rawEvents,
        containsAll(<Matcher>[
          isA<RawShowToastEvent>().having(
            (RawShowToastEvent event) => event.kind,
            'kind',
            PeerToastKind.peerDisconnected,
          ),
          isA<RawCloseOverlayEvent>(),
        ]),
      );
    });

    test('CmdTransportDisconnected omits toast for user disconnect', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.connected,
        remoteEndpoint: remoteEndpoint,
      );

      final ReduceResult result = reduce(
        prev: prev,
        command: const CmdTransportDisconnected(reason: PeerDisconnectReason.userDisconnect),
      );

      expect(result.next, const PeerSessionSnapshot());
      expect(result.rawEvents, <RawPeerUiEvent>[const RawCloseOverlayEvent()]);
    });

    test('CmdInvitationAccepted is a no-op', () {
      const PeerSessionSnapshot prev = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.hostInvitationDecision,
        role: PeerRole.server,
        pendingInvitation: remoteEndpoint,
      );

      final ReduceResult result = reduce(prev: prev, command: const CmdInvitationAccepted());

      expect(result.next, prev);
      expect(result.rawEvents, isEmpty);
    });

    test('CmdBleError maps every error kind to toast', () {
      const Map<PeerSessionErrorKind, PeerToastKind> expected =
          <PeerSessionErrorKind, PeerToastKind>{
            PeerSessionErrorKind.bluetoothUnavailable: PeerToastKind.bluetoothUnavailable,
            PeerSessionErrorKind.discoveryFailed: PeerToastKind.discoveryFailed,
            PeerSessionErrorKind.connectionFailed: PeerToastKind.connectionFailed,
            PeerSessionErrorKind.generic: PeerToastKind.genericError,
          };

      for (final MapEntry<PeerSessionErrorKind, PeerToastKind> entry in expected.entries) {
        final ReduceResult result = reduce(
          prev: const PeerSessionSnapshot(phase: PeerSessionCorePhase.clientDiscovering),
          command: CmdBleError(errorKind: entry.key),
        );

        expect(
          result.rawEvents,
          contains(
            isA<RawShowToastEvent>().having(
              (RawShowToastEvent event) => event.kind,
              'kind',
              entry.value,
            ),
          ),
        );
      }
    });
  });
}
