import 'package:core_ui/core_ui.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback? onTap;
  final AppIcon icon;
  final Color borderColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final double borderWidth;
  final bool visible;

  const CircularButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.borderColor,
    this.backgroundColor,
    this.iconColor,
    this.borderWidth = 3,
    this.visible = true,
  });

  static const double size = 120;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Color resolvedBackground = backgroundColor ?? colors.background.main;
    final Color resolvedIconColor = iconColor ?? colors.icons.main;
    final CircleBorder shape = CircleBorder(
      side: BorderSide(color: borderColor, width: borderWidth),
    );

    return SizedBox.square(
      dimension: size,
      child: Visibility(
        visible: visible,
        maintainAnimation: true,
        maintainSize: true,
        maintainState: true,
        child: Material(
          color: resolvedBackground,
          shape: shape,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: visible ? onTap : null,
            customBorder: shape,
            child: Center(child: icon.call(size: 64, color: resolvedIconColor)),
          ),
        ),
      ),
    );
  }
}
