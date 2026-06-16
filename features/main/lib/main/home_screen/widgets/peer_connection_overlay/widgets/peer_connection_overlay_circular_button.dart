import 'package:core_ui/core_ui.dart';

class PeerConnectionOverlayCircularButton extends StatelessWidget {
  const PeerConnectionOverlayCircularButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.icon,
    this.iconColor,
    this.size = 56,
  });

  final VoidCallback onTap;
  final Color backgroundColor;
  final IconData icon;
  final Color? iconColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color resolvedIconColor = iconColor ?? colors.text.white;
    final double iconSize = size * 0.4;

    return SizedBox.square(
      dimension: size,
      child: Material(
        color: backgroundColor,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Center(
            child: Icon(icon, size: iconSize, color: resolvedIconColor),
          ),
        ),
      ),
    );
  }
}
