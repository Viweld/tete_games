import 'package:peer/src/domain/models/peer/connection/app_connection_view_state.dart';
import 'package:peer/src/domain/models/peer/connection/peer_session_core_phase.dart';
import 'package:peer/src/domain/models/peer/connection/peer_session_snapshot.dart';
import 'package:peer/src/domain/models/peer/peer_endpoint.dart';

AppConnectionViewState projectFrame({required PeerSessionSnapshot snapshot}) {
  final PeerEndpoint? remote = snapshot.remoteEndpoint;
  final bool isConnected = snapshot.isConnected;

  return AppConnectionViewState(
    shared: SharedConnectionViewState(
      isConnected: isConnected,
      remoteDisplayName: remote?.identity.displayName,
      remotePlayerId: remote?.identity.id,
    ),
    overlay: OverlayRenderViewState(
      phase: overlayPhaseFromCore(snapshot.phase),
      role: snapshot.role,
      devices: snapshot.discoveredDevices,
      pendingInvitation: snapshot.pendingInvitation,
      isBusy:
          snapshot.phase == PeerSessionCorePhase.clientInviting ||
          snapshot.phase == PeerSessionCorePhase.hostInvitationDecision,
      errorKind: snapshot.errorKind,
    ),
  );
}
