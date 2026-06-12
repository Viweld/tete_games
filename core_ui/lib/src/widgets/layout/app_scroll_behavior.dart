import 'package:core_ui/core_ui.dart';

/// Scroll behavior without overscroll glow and bounce effect
class AppScrollBehavior extends ScrollBehavior {
  const AppScrollBehavior();

  /// Forces Android-like clamping scroll physics (no elastic overscroll)
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const ClampingScrollPhysics();

  /// Removes the default overscroll glow indicator
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}
