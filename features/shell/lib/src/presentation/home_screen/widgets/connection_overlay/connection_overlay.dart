import 'dart:ui';

import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/phase_client_discovering.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/phase_client_inviting.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/phase_error.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/phase_host_advertising.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/phase_host_invitation_decision.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/phase_role_selection.dart';

class ConnectionOverlay extends StatelessWidget {
  final OverlayRenderViewState overlay;
  final FrameProjectionInput projection;
  final VoidCallback onClose;
  final VoidCallback onHostTap;
  final VoidCallback onClientTap;
  final ValueChanged<String?> onDeviceTap;
  final VoidCallback onInviteTap;
  final VoidCallback onAcceptTap;
  final VoidCallback onRejectTap;

  const ConnectionOverlay({
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

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
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
                OverlayPhase.roleSelection => PhaseRoleSelection(
                  onHostTap: onHostTap,
                  onClientTap: onClientTap,
                ),
                OverlayPhase.hostAdvertising => const PhaseHostAdvertising(),
                OverlayPhase.hostInvitationDecision => PhaseHostInvitationDecision(
                  pendingInvitation: overlay.pendingInvitation,
                  onAcceptTap: onAcceptTap,
                  onRejectTap: onRejectTap,
                ),
                OverlayPhase.clientDiscovering => PhaseClientDiscovering(
                  devices: overlay.devices,
                  highlightedDeviceId: projection.highlightedDeviceId,
                  onDeviceTap: onDeviceTap,
                  onInviteTap: onInviteTap,
                ),
                OverlayPhase.clientInviting => PhaseClientInviting(
                  devices: overlay.devices,
                  invitedDeviceId: projection.highlightedDeviceId,
                ),
                OverlayPhase.clientInvitationRejected => PhaseClientInviting(
                  devices: overlay.devices,
                  invitedDeviceId: projection.highlightedDeviceId,
                  isRejected: true,
                ),
                OverlayPhase.error => const PhaseError(),
                OverlayPhase.hidden => const SizedBox.shrink(),
              },
            ),
          ),
        ],
      ),
    );
  }

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
}
