import 'package:domain/src/models/peer/connection/app_connection_view_state.dart';
import 'package:domain/src/models/peer/connection/frame_projection_input.dart';
import 'package:domain/src/models/peer/connection/peer_session_core_phase.dart';
import 'package:domain/src/models/peer/connection/peer_session_snapshot.dart';
import 'package:domain/src/models/peer/peer_endpoint.dart';

AppConnectionViewState projectFrame({
  required PeerSessionSnapshot snapshot,
  required FrameProjectionInput projection,
}) {
  final PeerEndpoint? remote = snapshot.remoteEndpoint;
  final bool isConnected = snapshot.isConnected;

  return AppConnectionViewState(
    shared: SharedConnectionViewState(
      isConnected: isConnected,
      remoteDisplayName: remote?.identity.displayName,
      remotePlayerId: remote?.identity.id,
    ),
    home: HomeRenderViewState(isGamesEnabled: isConnected),
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
