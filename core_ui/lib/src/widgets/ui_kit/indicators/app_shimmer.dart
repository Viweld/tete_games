import 'package:core_ui/core_ui.dart';
import 'package:shimmer/shimmer.dart';

/// A widget that displays a shimmer effect, commonly used as a loading placeholder.
class AppShimmer extends StatelessWidget {
  /// The width of the shimmer rectangle. Ignored if [isCircle] is true.
  final double? width;

  /// The height of the shimmer rectangle. Ignored if [isCircle] is true.
  final double? height;

  /// The diameter of the shimmer circle. Used only if [isCircle] is true.
  final double? diameter;

  /// The border radius of the shimmer rectangle. Ignored if [isCircle] is true.
  final BorderRadius? borderRadius;

  /// Indicates whether the shimmer should be displayed as a circle.
  final bool isCircle;

  /// Creates a rectangular shimmer widget.
  const AppShimmer.rectangle({super.key, this.height = 16, this.width, this.borderRadius})
    : diameter = null,
      isCircle = false,
      assert(
        height != null && height > 0,
        'Height must be provided and greater than 0 for rectangle',
      );

  /// Creates a circular shimmer widget.
  const AppShimmer.circle({super.key, this.diameter = 16})
    : height = null,
      width = null,
      borderRadius = null,
      isCircle = true,
      assert(
        diameter != null && diameter > 0,
        'Diameter must be provided and greater than 0 for circle',
      );

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Shimmer.fromColors(
      baseColor: colors.background.secondaryCard,
      highlightColor: colors.background.secondaryCard.withValues(alpha: 0.3),
      child: isCircle
          ? SizedBox.square(
              dimension: diameter,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.background.secondaryCard,
                  shape: BoxShape.circle,
                ),
              ),
            )
          : SizedBox(
              width: width ?? double.maxFinite,
              height: height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.background.secondaryCard,
                  borderRadius:
                      borderRadius ?? BorderRadius.all(Radius.circular((height ?? 1) * 0.15)),
                ),
              ),
            ),
    );
  }
}
