import 'package:flutter_test/flutter_test.dart';
import 'package:peer/peer_connection.dart';

void main() {
  const PeerDevice device = PeerDevice(id: 'device-1', name: 'Player', isOurApp: true);
  const PeerEndpoint remoteEndpoint = PeerEndpoint(
    identity: PeerIdentity(id: 'peer-1', displayName: 'Remote'),
    device: device,
  );

  group('projectFrame', () {
    test('maps connected snapshot to shared and hidden overlay', () {
      const PeerSessionSnapshot snapshot = PeerSessionSnapshot(
        sessionId: 'session-1',
        phase: PeerSessionCorePhase.connected,
        role: PeerRole.client,
        remoteEndpoint: remoteEndpoint,
      );

      final AppConnectionViewState viewState = projectFrame(snapshot: snapshot);

      expect(viewState.shared.isConnected, isTrue);
      expect(viewState.shared.remoteDisplayName, 'Remote');
      expect(viewState.shared.remotePlayerId, 'peer-1');
      expect(viewState.overlay.phase, OverlayPhase.hidden);
      expect(viewState.overlay.isBusy, isFalse);
    });

    test('marks overlay busy during client inviting', () {
      const PeerSessionSnapshot snapshot = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.clientInviting,
        role: PeerRole.client,
        invitedDeviceId: 'device-1',
      );

      final AppConnectionViewState viewState = projectFrame(snapshot: snapshot);

      expect(viewState.overlay.phase, OverlayPhase.clientInviting);
      expect(viewState.overlay.isBusy, isTrue);
    });

    test('marks overlay busy during host invitation decision', () {
      const PeerSessionSnapshot snapshot = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.hostInvitationDecision,
        role: PeerRole.server,
        pendingInvitation: remoteEndpoint,
      );

      final AppConnectionViewState viewState = projectFrame(snapshot: snapshot);

      expect(viewState.overlay.phase, OverlayPhase.hostInvitationDecision);
      expect(viewState.overlay.isBusy, isTrue);
      expect(viewState.overlay.pendingInvitation, remoteEndpoint);
    });

    test('projects discovered devices and error kind', () {
      const PeerSessionSnapshot snapshot = PeerSessionSnapshot(
        phase: PeerSessionCorePhase.error,
        role: PeerRole.client,
        discoveredDevices: <PeerDevice>[device],
        errorKind: PeerSessionErrorKind.discoveryFailed,
      );

      final AppConnectionViewState viewState = projectFrame(snapshot: snapshot);

      expect(viewState.overlay.phase, OverlayPhase.error);
      expect(viewState.overlay.devices, <PeerDevice>[device]);
      expect(viewState.overlay.errorKind, PeerSessionErrorKind.discoveryFailed);
    });
  });

  group('overlayPhaseFromCore', () {
    test('maps every core phase to overlay phase', () {
      const Map<PeerSessionCorePhase, OverlayPhase> expected = <PeerSessionCorePhase, OverlayPhase>{
        PeerSessionCorePhase.idle: OverlayPhase.hidden,
        PeerSessionCorePhase.roleSelection: OverlayPhase.roleSelection,
        PeerSessionCorePhase.hostAdvertising: OverlayPhase.hostAdvertising,
        PeerSessionCorePhase.hostInvitationDecision: OverlayPhase.hostInvitationDecision,
        PeerSessionCorePhase.clientDiscovering: OverlayPhase.clientDiscovering,
        PeerSessionCorePhase.clientInviting: OverlayPhase.clientInviting,
        PeerSessionCorePhase.connected: OverlayPhase.hidden,
        PeerSessionCorePhase.error: OverlayPhase.error,
      };

      for (final MapEntry<PeerSessionCorePhase, OverlayPhase> entry in expected.entries) {
        expect(overlayPhaseFromCore(entry.key), entry.value);
      }
    });
  });
}
