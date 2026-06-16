import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_overlay_circular_button.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_peer_card.dart';

class OverlayPhaseHostInvitationDecision extends StatelessWidget {
  const OverlayPhaseHostInvitationDecision({
    super.key,
    required this.pendingInvitation,
    required this.onAcceptTap,
    required this.onRejectTap,
  });

  final PeerEndpoint? pendingInvitation;
  final VoidCallback onAcceptTap;
  final VoidCallback onRejectTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;
    final String playerName = pendingInvitation?.identity.displayName ?? '';
    final String title = playerName.isEmpty ? localization.peer_client_unknown_device : playerName;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          PeerConnectionPeerCard(
            title: title,
            subtitle: localization.peer_peer_card_connection_request,
            visualState: PeerConnectionPeerCardVisualState.normal,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PeerConnectionOverlayCircularButton(
                backgroundColor: colors.text.error,
                icon: Icons.close_rounded,
                onTap: onRejectTap,
              ),
              const SizedBox(width: 32),
              PeerConnectionOverlayCircularButton(
                backgroundColor: colors.background.successGreen,
                icon: Icons.check_rounded,
                onTap: onAcceptTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
