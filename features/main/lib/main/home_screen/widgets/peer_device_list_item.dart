import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

class PeerDeviceListItem extends StatelessWidget {
  const PeerDeviceListItem({
    super.key,
    required this.device,
    required this.isSelected,
    required this.onTap,
    required this.unknownDeviceLabel,
    required this.ourAppSubtitle,
  });

  final PeerDevice device;
  final bool isSelected;
  final VoidCallback onTap;
  final String unknownDeviceLabel;
  final String ourAppSubtitle;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String title = device.name.isEmpty ? unknownDeviceLabel : device.name;

    return ListTile(
      onTap: onTap,
      leading: Icon(
        device.isOurApp ? Icons.sports_esports : Icons.bluetooth,
        color: device.isOurApp ? colors.text.success : colors.text.secondary,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: device.isOurApp ? colors.text.success : colors.text.main,
        ),
      ),
      subtitle: device.isOurApp ? Text(ourAppSubtitle) : null,
      trailing: isSelected
          ? Icon(Icons.check_circle, color: colors.text.accent)
          : device.isOurApp
          ? Icon(Icons.star, color: colors.text.success, size: 20)
          : null,
    );
  }
}
