import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:shell/shell_domain.dart';
import 'package:peer/peer_connection.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/centered_message.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/circular_button.dart';
import 'package:shell/src/presentation/home_screen/widgets/connection_overlay/widgets/peer_card.dart';

class PhaseClientDiscovering extends StatelessWidget {
  final List<PeerDevice> devices;
  final String? highlightedDeviceId;
  final ValueChanged<String?> onDeviceTap;
  final VoidCallback onInviteTap;

  const PhaseClientDiscovering({
    super.key,
    required this.devices,
    required this.highlightedDeviceId,
    required this.onDeviceTap,
    required this.onInviteTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    if (devices.isEmpty) {
      return const CenteredMessage.discovering();
    }

    final bool hasSelection = highlightedDeviceId != null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          for (int index = 0; index < devices.length; index++) ...<Widget>[
            if (index > 0) const SizedBox(height: 10),
            _PhaseClientDiscoveringDeviceCard(
              device: devices[index],
              highlightedDeviceId: highlightedDeviceId,
              onDeviceTap: onDeviceTap,
            ),
          ],
          const SizedBox(height: 24),
          CircularButton(
            borderColor: colors.background.successGreen,
            icon: AppIcons.confirm,
            visible: hasSelection,
            onTap: onInviteTap,
          ),
        ],
      ),
    );
  }
}

class _PhaseClientDiscoveringDeviceCard extends StatelessWidget {
  final PeerDevice device;
  final String? highlightedDeviceId;
  final ValueChanged<String?> onDeviceTap;

  const _PhaseClientDiscoveringDeviceCard({
    required this.device,
    required this.highlightedDeviceId,
    required this.onDeviceTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final bool isSelected = highlightedDeviceId == device.id;
    final String title = device.name.isEmpty
        ? localization.peer_client_unknown_device
        : device.name;

    return PeerCard(
      title: title,
      subtitle: localization.peer_peer_card_waiting_invitation,
      visualState: isSelected ? PeerCardVisualState.selected : PeerCardVisualState.normal,
      onTap: () {
        final String? nextId = isSelected ? null : device.id;
        onDeviceTap(nextId);
      },
    );
  }
}
