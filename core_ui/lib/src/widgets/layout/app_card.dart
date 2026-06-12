import 'package:core_ui/core_ui.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.backgroundColor,
  });

  static const double radius = 20;

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(radius));
    final AppColorsTheme colors = context.colors;

    final Widget content = Container(
      padding: padding ?? const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: backgroundColor ?? colors.background.secondaryCard,
        borderRadius: borderRadius,
        border: Border.all(color: colors.borders.main),
        boxShadow: colors.dialogShadows,
      ),
      child: child,
    );

    if (onTap == null) return content;

    return Stack(
      children: <Widget>[
        content,
        Positioned.fill(
          child: Material(
            borderRadius: borderRadius,
            color: Colors.transparent,
            child: InkWell(borderRadius: borderRadius, onTap: onTap),
          ),
        ),
      ],
    );
  }
}
