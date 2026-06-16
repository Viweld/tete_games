import 'dart:ui';

import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/overlay_phase_client_discovering.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/overlay_phase_client_inviting.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/overlay_phase_error.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/overlay_phase_host_advertising.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/overlay_phase_host_invitation_decision.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/overlay_phase_role_selection.dart';

class PeerConnectionOverlay extends StatelessWidget {
  const PeerConnectionOverlay({
    super.key,
    required this.overlay,
    required this.projection,
    required this.onClose,
    required this.onHostTap,
    required this.onClientTap,
    required this.onDeviceTap,
    required this.onInviteTap,
    required this.onAcceptTap,
    required this.onRejectTap,
  });

  final OverlayRenderViewState overlay;
  final FrameProjectionInput projection;
  final VoidCallback onClose;
  final VoidCallback onHostTap;
  final VoidCallback onClientTap;
  final ValueChanged<String?> onDeviceTap;
  final VoidCallback onInviteTap;
  final VoidCallback onAcceptTap;
  final VoidCallback onRejectTap;

  bool get _isBottomAlignedPhase {
    return switch (overlay.phase) {
      OverlayPhase.roleSelection ||
      OverlayPhase.hostInvitationDecision ||
      OverlayPhase.clientDiscovering ||
      OverlayPhase.clientInviting ||
      OverlayPhase.clientInvitationRejected => true,
      OverlayPhase.hidden || OverlayPhase.hostAdvertising || OverlayPhase.error => false,
    };
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onClose,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: colors.barrierBlurSigma,
                  sigmaY: colors.barrierBlurSigma,
                ),
                child: ColoredBox(color: colors.barrierColor),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Align(
            alignment: _isBottomAlignedPhase ? Alignment.bottomCenter : Alignment.center,
            child: switch (overlay.phase) {
              OverlayPhase.roleSelection => OverlayPhaseRoleSelection(
                onHostTap: onHostTap,
                onClientTap: onClientTap,
              ),
              OverlayPhase.hostAdvertising => const OverlayPhaseHostAdvertising(),
              OverlayPhase.hostInvitationDecision => OverlayPhaseHostInvitationDecision(
                pendingInvitation: overlay.pendingInvitation,
                onAcceptTap: onAcceptTap,
                onRejectTap: onRejectTap,
              ),
              OverlayPhase.clientDiscovering => OverlayPhaseClientDiscovering(
                devices: overlay.devices,
                highlightedDeviceId: projection.highlightedDeviceId,
                onDeviceTap: onDeviceTap,
                onInviteTap: onInviteTap,
              ),
              OverlayPhase.clientInviting => OverlayPhaseClientInviting(
                devices: overlay.devices,
                invitedDeviceId: projection.highlightedDeviceId,
              ),
              OverlayPhase.clientInvitationRejected => OverlayPhaseClientInviting(
                devices: overlay.devices,
                invitedDeviceId: projection.highlightedDeviceId,
                isRejected: true,
              ),
              OverlayPhase.error => const OverlayPhaseError(),
              OverlayPhase.hidden => const SizedBox.shrink(),
            },
          ),
        ),
      ],
    );
  }
}
