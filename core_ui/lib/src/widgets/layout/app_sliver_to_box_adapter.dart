import 'package:core_ui/core_ui.dart';
import 'package:flutter/rendering.dart';

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
  double? _childHeight;

  void _onSizeChanged(Size size) {
    if (!mounted || _childHeight == size.height) return;
    setState(() => _childHeight = size.height);
  }

  @override
  Widget build(BuildContext context) {
    // If not pinned, use regular SliverToBoxAdapter
    if (!widget.pinned) return SliverToBoxAdapter(child: widget.child);

    // For pinned mode, we need to measure the child first
    // If height is not yet measured, render the child offscreen to measure it
    if (_childHeight == null) {
      return SliverToBoxAdapter(
        child: _MeasureSize(onChange: _onSizeChanged, child: widget.child),
      );
    }

    // Once height is known, use SliverPersistentHeader with measured height
    return SliverPersistentHeader(
      pinned: true,
      delegate: _DynamicSliverHeaderDelegate(height: _childHeight!, child: widget.child),
    );
  }
}

/// A widget that measures its child's size and reports it via a callback.
class _MeasureSize extends SingleChildRenderObjectWidget {
  final ValueChanged<Size> onChange;

  const _MeasureSize({required this.onChange, required Widget child}) : super(child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MeasureSizeRenderObject(onChange);
  }

  @override
  void updateRenderObject(BuildContext context, _MeasureSizeRenderObject renderObject) {
    renderObject.onChange = onChange;
  }
}

class _MeasureSizeRenderObject extends RenderProxyBox {
  ValueChanged<Size> onChange;
  Size? _oldSize;

  _MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    final Size newSize = child!.size;
    if (_oldSize != newSize) {
      _oldSize = newSize;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onChange(newSize);
      });
    }
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
    return SizedBox(height: height, child: child);
  }

  @override
  bool shouldRebuild(_DynamicSliverHeaderDelegate oldDelegate) {
    return height != oldDelegate.height || child != oldDelegate.child;
  }
}
