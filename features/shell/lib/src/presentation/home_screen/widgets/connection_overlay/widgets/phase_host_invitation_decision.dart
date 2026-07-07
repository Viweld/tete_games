import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:peer/peer_connection.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/circular_button.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/peer_card.dart';

class PhaseHostInvitationDecision extends StatelessWidget {
  final PeerEndpoint? pendingInvitation;
  final VoidCallback onAcceptTap;
  final VoidCallback onRejectTap;

  const PhaseHostInvitationDecision({
    super.key,
    required this.pendingInvitation,
    required this.onAcceptTap,
    required this.onRejectTap,
  });

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
          PeerCard(
            title: title,
            subtitle: localization.peer_peer_card_connection_request,
            visualState: PeerCardVisualState.normal,
            leadingIcon: AppIcons.person,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 24,
            children: <Widget>[
              CircularButton(
                borderColor: colors.text.error,
                icon: AppIcons.decline,
                onTap: onRejectTap,
              ),
              CircularButton(
                borderColor: colors.background.successGreen,
                icon: AppIcons.confirm,
                onTap: onAcceptTap,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
