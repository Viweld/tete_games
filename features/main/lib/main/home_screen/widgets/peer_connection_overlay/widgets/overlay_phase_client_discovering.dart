import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_overlay_centered_message.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_overlay_circular_button.dart';
import 'package:main/main/home_screen/widgets/peer_connection_overlay/widgets/peer_connection_peer_card.dart';

class OverlayPhaseClientDiscovering extends StatelessWidget {
  const OverlayPhaseClientDiscovering({
    super.key,
    required this.devices,
    required this.highlightedDeviceId,
    required this.onDeviceTap,
    required this.onInviteTap,
  });

  final List<PeerDevice> devices;
  final String? highlightedDeviceId;
  final ValueChanged<String?> onDeviceTap;
  final VoidCallback onInviteTap;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    if (devices.isEmpty) {
      return const PeerConnectionOverlayCenteredMessage(showsLoadingIndicator: true);
    }

    final bool hasSelection = highlightedDeviceId != null;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (int index = 0; index < devices.length; index++) ...<Widget>[
                if (index > 0) const SizedBox(height: 10),
                _OverlayPhaseClientDiscoveringDeviceCard(
                  device: devices[index],
                  highlightedDeviceId: highlightedDeviceId,
                  onDeviceTap: onDeviceTap,
                ),
              ],
              if (hasSelection) const SizedBox(height: 72),
            ],
          ),
          if (hasSelection)
            Positioned(
              right: 0,
              bottom: 0,
              child: PeerConnectionOverlayCircularButton(
                backgroundColor: colors.background.successGreen,
                icon: Icons.check_rounded,
                onTap: onInviteTap,
              ),
            ),
        ],
      ),
    );
  }
}

class _OverlayPhaseClientDiscoveringDeviceCard extends StatelessWidget {
  const _OverlayPhaseClientDiscoveringDeviceCard({
    required this.device,
    required this.highlightedDeviceId,
    required this.onDeviceTap,
  });

  final PeerDevice device;
  final String? highlightedDeviceId;
  final ValueChanged<String?> onDeviceTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final bool isSelected = highlightedDeviceId == device.id;
    final String title = device.name.isEmpty
        ? localization.peer_client_unknown_device
        : device.name;

    return PeerConnectionPeerCard(
      title: title,
      subtitle: localization.peer_peer_card_waiting_invitation,
      visualState: isSelected
          ? PeerConnectionPeerCardVisualState.selected
          : PeerConnectionPeerCardVisualState.normal,
      onTap: () {
        final String? nextId = isSelected ? null : device.id;
        onDeviceTap(nextId);
      },
    );
  }
}
