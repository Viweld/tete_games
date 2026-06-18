import 'package:core_ui/core_ui.dart';

class BluetoothStatusIndicatorIcon extends StatelessWidget {
  const BluetoothStatusIndicatorIcon({
    super.key,
    required this.icon,
    required this.tooltip,
    required this.onTap,
    required this.iconColor,
  });

  final AppIcon icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color iconColor;

  static const double _iconSize = 32;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: icon.call(size: _iconSize, onTap: onTap, color: iconColor),
      ),
    );
  }
}
