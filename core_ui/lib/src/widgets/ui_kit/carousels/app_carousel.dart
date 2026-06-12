import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppCarousel extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final double padding;
  final double verticalPadding;
  final double gap;
  final int? focusedIndex;
  final ValueChanged<int>? onFocusedIndexChanged;

  const AppCarousel({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.padding = 14.0,
    this.verticalPadding = 8.0,
    this.gap = 14.0,
    this.focusedIndex,
    this.onFocusedIndexChanged,
  });

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}

class _AppCarouselState extends State<AppCarousel> {
  static const Duration _focusAnimationDuration = Duration(milliseconds: 300);
  static const Curve _focusAnimationCurve = Curves.easeOut;

  final ScrollController _controller = ScrollController();
  double _itemWidth = 0;
  double _viewportWidth = 0;
  int _currentIndex = 0;
  bool _pendingInitialScroll = false;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.focusedIndex ?? 0;
    _pendingInitialScroll = _currentIndex > 0;
    _controller.addListener(_handleScroll);
  }

  @override
  void didUpdateWidget(covariant AppCarousel oldWidget) {
    super.didUpdateWidget(oldWidget);

    final int? focusedIndex = widget.focusedIndex;
    if (focusedIndex == null || focusedIndex == _currentIndex) {
      return;
    }

    _currentIndex = focusedIndex;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _animateToIndex(focusedIndex);
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_handleScroll);
    _controller.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (!_controller.hasClients || _itemWidth <= 0 || widget.itemCount == 0) {
      return;
    }

    final int rounded = _CarouselLayout.focusedIndex(
      scrollOffset: _controller.offset,
      viewportWidth: _controller.position.viewportDimension,
      itemWidth: _itemWidth,
      gap: widget.gap,
      padding: widget.padding,
      itemCount: widget.itemCount,
    );

    if (rounded == _currentIndex) return;

    _currentIndex = rounded;
    widget.onFocusedIndexChanged?.call(rounded);
  }

  void _animateToIndex(int index) {
    if (!_controller.hasClients || _itemWidth <= 0) return;

    final ScrollPosition position = _controller.position;
    final double target = _CarouselLayout.scrollOffsetForIndex(
      index: index,
      metrics: position,
      itemWidth: _itemWidth,
      gap: widget.gap,
      padding: widget.padding,
    ).clamp(position.minScrollExtent, position.maxScrollExtent);

    if ((target - position.pixels).abs() < 0.5) return;

    _controller.animateTo(target, duration: _focusAnimationDuration, curve: _focusAnimationCurve);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) {
      return const SizedBox.shrink();
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double screenWidth = constraints.maxWidth;
        if (screenWidth == 0 || screenWidth.isInfinite) {
          return const SizedBox.shrink();
        }

        _itemWidth = screenWidth - 100;
        _viewportWidth = screenWidth;

        if (_pendingInitialScroll) {
          _pendingInitialScroll = false;
          final int initialIndex = _currentIndex;
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (!mounted) return;
            _animateToIndex(initialIndex);
          });
        }

        final bool hasBoundedHeight = constraints.hasBoundedHeight;
        final ScrollPhysics physics = _CarouselScrollPhysics(
          itemWidth: _itemWidth,
          gap: widget.gap,
          padding: widget.padding,
        );
        final EdgeInsets padding = EdgeInsets.symmetric(
          horizontal: widget.padding,
          vertical: widget.verticalPadding,
        );

        if (!hasBoundedHeight) {
          return _UnboundedCarouselBody(
            controller: _controller,
            physics: physics,
            padding: padding,
            itemWidth: _itemWidth,
            viewportWidth: _viewportWidth,
            gap: widget.gap,
            innerPadding: widget.padding,
            itemCount: widget.itemCount,
            itemBuilder: widget.itemBuilder,
            onPeekTap: _animateToIndex,
          );
        }

        final double itemHeight = constraints.maxHeight - widget.verticalPadding * 2;

        return ListView.separated(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          physics: physics,
          padding: padding,
          itemCount: widget.itemCount,
          addAutomaticKeepAlives: false,
          scrollCacheExtent: ScrollCacheExtent.pixels(_itemWidth),
          separatorBuilder: (BuildContext context, int index) => SizedBox(width: widget.gap),
          itemBuilder: (BuildContext context, int index) {
            return _CarouselItemPeekTapWrapper(
              index: index,
              scrollController: _controller,
              itemWidth: _itemWidth,
              viewportWidth: _viewportWidth,
              gap: widget.gap,
              padding: widget.padding,
              itemCount: widget.itemCount,
              onPeekTap: _animateToIndex,
              child: SizedBox(
                width: _itemWidth,
                height: itemHeight,
                child: widget.itemBuilder(context, index),
              ),
            );
          },
        );
      },
    );
  }
}

/// Non-lazy fallback used when the carousel has no bounded height.
///
/// A horizontal [ListView] requires a finite cross-axis (height) extent, so it
/// cannot lazily size itself to the tallest item. This body keeps the original
/// [Row]-based layout for those (always short) lists, letting items define the
/// carousel height intrinsically.
class _UnboundedCarouselBody extends StatelessWidget {
  const _UnboundedCarouselBody({
    required this.controller,
    required this.physics,
    required this.padding,
    required this.itemWidth,
    required this.viewportWidth,
    required this.gap,
    required this.innerPadding,
    required this.itemCount,
    required this.itemBuilder,
    required this.onPeekTap,
  });

  final ScrollController controller;
  final ScrollPhysics physics;
  final EdgeInsets padding;
  final double itemWidth;
  final double viewportWidth;
  final double gap;
  final double innerPadding;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final ValueChanged<int> onPeekTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      physics: physics,
      padding: padding,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(itemCount * 2 - 1, (int slotIndex) {
          if (slotIndex.isOdd) {
            return SizedBox(width: gap);
          }

          final int index = slotIndex ~/ 2;

          return _CarouselItemPeekTapWrapper(
            index: index,
            scrollController: controller,
            itemWidth: itemWidth,
            viewportWidth: viewportWidth,
            gap: gap,
            padding: innerPadding,
            itemCount: itemCount,
            onPeekTap: onPeekTap,
            child: SizedBox(width: itemWidth, child: itemBuilder(context, index)),
          );
        }),
      ),
    );
  }
}

/// Listens for taps on the visible (peeking) portion of a non-focused card.
///
/// Uses [Listener] instead of [GestureDetector] so scroll-to-focus and the
/// child's tap handler can both run.
class _CarouselItemPeekTapWrapper extends StatelessWidget {
  const _CarouselItemPeekTapWrapper({
    required this.index,
    required this.scrollController,
    required this.itemWidth,
    required this.viewportWidth,
    required this.gap,
    required this.padding,
    required this.itemCount,
    required this.onPeekTap,
    required this.child,
  });

  final int index;
  final ScrollController scrollController;
  final double itemWidth;
  final double viewportWidth;
  final double gap;
  final double padding;
  final int itemCount;
  final ValueChanged<int> onPeekTap;
  final Widget child;

  void _handlePointerUp(PointerUpEvent event) {
    if (!scrollController.hasClients || itemWidth <= 0) return;

    final double scrollOffset = scrollController.offset;
    final int focusedIndex = _CarouselLayout.focusedIndex(
      scrollOffset: scrollOffset,
      viewportWidth: viewportWidth,
      itemWidth: itemWidth,
      gap: gap,
      padding: padding,
      itemCount: itemCount,
    );

    if (index == focusedIndex) return;

    final ({double left, double right}) bounds = _CarouselLayout.visibleHorizontalBoundsInItem(
      index: index,
      scrollOffset: scrollOffset,
      viewportWidth: viewportWidth,
      itemWidth: itemWidth,
      gap: gap,
      padding: padding,
    );

    if (bounds.right <= bounds.left) return;

    final double tapX = event.localPosition.dx;
    if (tapX < bounds.left || tapX > bounds.right) return;

    onPeekTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerUp: _handlePointerUp,
      child: child,
    );
  }
}

class _CarouselLayout {
  _CarouselLayout._();

  static int focusedIndex({
    required double scrollOffset,
    required double viewportWidth,
    required double itemWidth,
    required double gap,
    required double padding,
    required int itemCount,
  }) {
    if (itemCount == 0 || itemWidth <= 0) return 0;

    final double width = itemWidth + gap;
    final double page = (scrollOffset - itemWidth / 2 - padding + viewportWidth / 2) / width;
    return page.round().clamp(0, itemCount - 1);
  }

  static double scrollOffsetForIndex({
    required int index,
    required ScrollMetrics metrics,
    required double itemWidth,
    required double gap,
    required double padding,
  }) {
    final double width = itemWidth + gap;
    final double centerOffset = index * width + itemWidth / 2 + padding;
    return centerOffset - metrics.viewportDimension / 2;
  }

  static double itemLeftOnScreen({
    required int index,
    required double scrollOffset,
    required double itemWidth,
    required double gap,
    required double padding,
  }) {
    final double width = itemWidth + gap;
    return padding + index * width - scrollOffset;
  }

  /// Horizontal tap bounds in item-local coordinates for the on-screen portion.
  static ({double left, double right}) visibleHorizontalBoundsInItem({
    required int index,
    required double scrollOffset,
    required double viewportWidth,
    required double itemWidth,
    required double gap,
    required double padding,
  }) {
    final double itemLeft = itemLeftOnScreen(
      index: index,
      scrollOffset: scrollOffset,
      itemWidth: itemWidth,
      gap: gap,
      padding: padding,
    );
    final double itemRight = itemLeft + itemWidth;

    final double visibleLeft = itemLeft.clamp(0, viewportWidth);
    final double visibleRight = itemRight.clamp(0, viewportWidth);

    final double localLeft = (visibleLeft - itemLeft).clamp(0, itemWidth);
    final double localRight = (visibleRight - itemLeft).clamp(0, itemWidth);

    return (left: localLeft, right: localRight);
  }
}

class _CarouselScrollPhysics extends ScrollPhysics {
  final double itemWidth;
  final double gap;
  final double padding;

  const _CarouselScrollPhysics({
    required this.itemWidth,
    this.gap = 14,
    this.padding = 14,
    super.parent,
  });

  @override
  _CarouselScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return _CarouselScrollPhysics(
      itemWidth: itemWidth,
      gap: gap,
      padding: padding,
      parent: buildParent(ancestor),
    );
  }

  double _getPixels(ScrollMetrics position, double page) {
    final double width = itemWidth + gap;
    final double centerOffset = page * width + itemWidth / 2 + padding;
    return centerOffset - position.viewportDimension / 2;
  }

  double _getPage(ScrollMetrics position, double pixels) {
    final double width = itemWidth + gap;
    return (pixels - itemWidth / 2 - padding + position.viewportDimension / 2) / width;
  }

  @override
  Simulation? createBallisticSimulation(ScrollMetrics position, double velocity) {
    if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
        (velocity >= 0.0 && position.pixels >= position.maxScrollExtent)) {
      return super.createBallisticSimulation(position, velocity);
    }

    final Tolerance tolerance = toleranceFor(position);
    final double page = _getPage(position, position.pixels);
    final double targetPage = (velocity < -tolerance.velocity)
        ? page.floorToDouble()
        : (velocity > tolerance.velocity)
        ? page.ceilToDouble()
        : page.roundToDouble();

    final double dest = _getPixels(
      position,
      targetPage,
    ).clamp(position.minScrollExtent, position.maxScrollExtent);

    if (dest == position.pixels) return null;

    return ScrollSpringSimulation(spring, position.pixels, dest, velocity, tolerance: tolerance);
  }
}
