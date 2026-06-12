import 'package:core_ui/core_ui.dart';

/// A wrapper widget for tracking the scroll of a scrollable child.
///
/// When approaching the end of the list (within [actuationRange]),
/// it calls the [onEndReached] callback, allowing for infinite
/// pagination without using a [ScrollController].
///
/// Example usage:
/// ```dart
/// AppPaginationListener(
///   onEndReached: () => bloc.add(const LoadNextPage()),
///   child: CustomScrollView(
///     slivers: ...,
///   ),
/// )
/// ```
class AppPaginationListener extends StatelessWidget {
  /// The scrollable child (ListView, CustomScrollView, etc.).
  final Widget child;

  /// Callback called when reaching the end of the list.
  final VoidCallback onEndReached;

  /// Distance from the end of the list in pixels at which [onEndReached] is triggered.
  final double actuationRange;

  const AppPaginationListener({
    super.key,
    required this.child,
    required this.onEndReached,
    this.actuationRange = 500,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: _onScrollNotification,
      child: child,
    );
  }

  bool _onScrollNotification(ScrollMetricsNotification notification) {
    final bool scrolledToBottom = notification.metrics.extentAfter < actuationRange;
    if (scrolledToBottom) {
      onEndReached();
    }
    return false;
  }
}
