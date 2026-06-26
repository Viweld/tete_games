import 'package:core_ui/core_ui.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback? onTap;
  final AppIcon icon;
  final double? iconSize;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? iconColor;
  final double borderWidth;
  final bool visible;

  const CircularButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.iconSize,
    this.borderColor,
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
    final CircleBorder shape = CircleBorder(
      side: borderColor == null
          ? BorderSide.none
          : BorderSide(color: borderColor!, width: borderWidth),
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
          shadowColor: Colors.black,
          elevation: 10,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: visible ? onTap : null,
            customBorder: shape,
            child: Center(
              child: icon.call(size: iconSize ?? size, color: iconColor),
            ),
          ),
        ),
      ),
    );
  }
}
