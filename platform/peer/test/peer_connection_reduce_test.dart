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
  });
}
