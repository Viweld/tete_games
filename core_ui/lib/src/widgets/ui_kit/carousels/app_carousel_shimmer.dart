import 'package:core_ui/core_ui.dart';

/// A shimmer placeholder for carousel items.
/// Displays a detailed shimmer that mimics the MainCarouselItem structure
/// showing a full card and a partial second card on the right edge.
class AppCarouselShimmer extends StatelessWidget {
  const AppCarouselShimmer({super.key});

  static const double _borderRadius = 6;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double screenWidth = constraints.maxWidth;
        if (screenWidth == 0 || screenWidth.isInfinite) return const SizedBox.shrink();

        return SizedBox(
          width: screenWidth,
          height: constraints.maxHeight,
          child: Padding(
            padding: const EdgeInsets.only(left: AppDimens.defaultHorizontalPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: constraints.maxHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: <Widget>[
                        Expanded(
                          child: AppShimmer.rectangle(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            borderRadius: BorderRadius.circular(_borderRadius),
                          ),
                        ),
                        const SizedBox(height: 6),
                        AppShimmer.rectangle(height: 20, width: screenWidth * 0.3),
                        AppShimmer.rectangle(height: 20, width: screenWidth * 0.5),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                SizedBox(
                  height: constraints.maxHeight,
                  width: 80,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 4,
                    children: <Widget>[
                      Expanded(
                        child: AppShimmer.rectangle(
                          height: double.maxFinite,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(_borderRadius),
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      AppShimmer.rectangle(
                        height: 20,
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(_borderRadius)),
                      ),
                      AppShimmer.rectangle(
                        height: 20,
                        borderRadius: BorderRadius.horizontal(left: Radius.circular(_borderRadius)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
