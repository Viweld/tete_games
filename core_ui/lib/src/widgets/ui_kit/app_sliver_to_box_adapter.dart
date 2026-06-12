import 'package:flutter/material.dart';

/// A sliver that contains a single box widget with optional pinned positioning.
///
/// When [pinned] is `false` (default), behaves like a regular [SliverToBoxAdapter].
/// When [pinned] is `true`, uses [SliverPersistentHeader] to keep the content
/// fixed at the top while other content scrolls beneath it.
///
/// The height is automatically measured from the child widget, so no manual
/// height calculation is required.
///
/// Example:
/// ```dart
/// CustomScrollView(
///   slivers: [
///     AppSliverToBoxAdapter(
///       pinned: true,
///       child: Container(
///         padding: EdgeInsets.all(16),
///         child: Text('Fixed Header'),
///       ),
///     ),
///     SliverList(...),
///   ],
/// )
/// ```
class AppSliverToBoxAdapter extends StatefulWidget {
  /// The widget to display in the sliver.
  final Widget child;

  /// Whether to pin this sliver at the top when scrolling.
  ///
  /// When `true`, the sliver stays fixed at the top while content scrolls beneath it.
  /// When `false` (default), the sliver scrolls normally with other content.
  final bool pinned;

  const AppSliverToBoxAdapter({super.key, required this.child, this.pinned = false});

  @override
  State<AppSliverToBoxAdapter> createState() => _AppSliverToBoxAdapterState();
}

class _AppSliverToBoxAdapterState extends State<AppSliverToBoxAdapter> {
  final GlobalKey _childKey = GlobalKey();
  double _childHeight = 0.0;
  bool _isHeightMeasured = false;

  @override
  void initState() {
    super.initState();
    if (widget.pinned) {
      // Measure child height after first frame
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureChildHeight());
    }
  }

  @override
  void didUpdateWidget(AppSliverToBoxAdapter oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Re-measure if child changed or pinned state changed
    if (widget.pinned && (widget.child != oldWidget.child || widget.pinned != oldWidget.pinned)) {
      _isHeightMeasured = false;
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureChildHeight());
    }
  }

  void _measureChildHeight() {
    final RenderBox? renderBox = _childKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null && mounted) {
      final double measuredHeight = renderBox.size.height;
      if (measuredHeight != _childHeight) {
        setState(() {
          _childHeight = measuredHeight;
          _isHeightMeasured = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // If not pinned, use regular SliverToBoxAdapter
    if (!widget.pinned) return SliverToBoxAdapter(child: widget.child);

    // For pinned mode, use SliverPersistentHeader with measured height
    // Use a reasonable default height on first build before measurement
    final double effectiveHeight = _isHeightMeasured ? _childHeight : 300.0;

    return SliverPersistentHeader(
      pinned: true,
      delegate: _DynamicSliverHeaderDelegate(
        height: effectiveHeight,
        child: KeyedSubtree(key: _childKey, child: widget.child),
      ),
    );
  }
}

/// Custom delegate for [SliverPersistentHeader] with dynamic height measurement.
class _DynamicSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;

  _DynamicSliverHeaderDelegate({required this.child, required this.height});

  @override
  double get minExtent => height;

  @override
  double get maxExtent => height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_DynamicSliverHeaderDelegate oldDelegate) {
    return height != oldDelegate.height || child != oldDelegate.child;
  }
}
