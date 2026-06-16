import 'package:core_ui/core_ui.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_overlay_circular_button.dart';

class OverlayPhaseRoleSelection extends StatelessWidget {
  const OverlayPhaseRoleSelection({super.key, required this.onHostTap, required this.onClientTap});

  final VoidCallback onHostTap;
  final VoidCallback onClientTap;

  static const double _roleButtonSize = 72;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PeerConnectionOverlayCircularButton(
            size: _roleButtonSize,
            backgroundColor: colors.background.main,
            iconColor: colors.icons.main,
            icon: Icons.wifi_tethering_rounded,
            onTap: onHostTap,
          ),
          const SizedBox(width: 40),
          PeerConnectionOverlayCircularButton(
            size: _roleButtonSize,
            backgroundColor: colors.background.main,
            iconColor: colors.icons.main,
            icon: Icons.search_rounded,
            onTap: onClientTap,
          ),
        ],
      ),
    );
  }
}
