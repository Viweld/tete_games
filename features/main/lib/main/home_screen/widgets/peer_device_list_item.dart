import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

class PeerDeviceListItem extends StatelessWidget {
  const PeerDeviceListItem({
    super.key,
    required this.device,
    required this.isSelected,
    required this.onTap,
  });

  final PeerDevice device;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;
    final String title = device.name.isEmpty
        ? localization.peer_client_unknown_device
        : device.name;
    final TextStyle titleStyle = (isSelected ? AppFonts.b4 : AppFonts.b2).copyWith(
      color: device.isOurApp ? colors.text.success : colors.text.main,
    );

    return ListTile(
      onTap: onTap,
      leading: Icon(
        device.isOurApp ? Icons.sports_esports : Icons.bluetooth,
        color: device.isOurApp ? colors.text.success : colors.text.secondary,
      ),
      title: Text(title, style: titleStyle),
      subtitle: device.isOurApp
          ? Text(
              localization.peer_client_our_app_badge,
              style: AppFonts.caption.copyWith(color: colors.text.secondary),
            )
          : null,
      trailing: isSelected
          ? Icon(Icons.check_circle, color: colors.text.accent)
          : device.isOurApp
          ? Icon(Icons.star, color: colors.text.success, size: 20)
          : null,
    );
  }
}
