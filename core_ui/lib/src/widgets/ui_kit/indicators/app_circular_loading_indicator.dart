import 'package:core_ui/core_ui.dart';

class AppCircularLoadingIndicator extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  final Color? color;
  final Color? backgroundColor;

  const AppCircularLoadingIndicator({
    super.key,
    this.size,
    this.strokeWidth,
    this.color,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Center(
      child: SizedBox.square(
        dimension: size ?? 48,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth ?? 4,
          valueColor: AlwaysStoppedAnimation<Color>(color ?? colors.text.main),
          backgroundColor: backgroundColor ?? colors.unknown,
          strokeCap: StrokeCap.round,
        ),
      ),
    );
  }
}
