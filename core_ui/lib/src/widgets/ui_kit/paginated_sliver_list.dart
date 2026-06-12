import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

typedef ItemWidgetBuilder<T> = Widget Function(BuildContext context, T item, int index);
typedef SeparatorWidgetBuilder = Widget Function(BuildContext context, int index);

class PaginatedSliverList<T> extends StatefulWidget {
  final List<T> items;
  final ItemWidgetBuilder<T> itemBuilder;
  final SeparatorWidgetBuilder separatorBuilder;
  final VoidCallback onNextPage;
  final int preloadThreshold;

  final PaginationState state;

  const PaginatedSliverList({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.state,
    required this.onNextPage,
    this.preloadThreshold = 10,
  });

  @override
  State<PaginatedSliverList<T>> createState() => _PaginatedSliverListState<T>();
}

class _PaginatedSliverListState<T> extends State<PaginatedSliverList<T>> {
  bool _isRequesting = false;
  int _lastCount = 0;

  @override
  void didUpdateWidget(covariant PaginatedSliverList<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final int newCount = widget.items.length;
    if (newCount > _lastCount) {
      _lastCount = newCount;
      if (_isRequesting) _isRequesting = false;
    }

    if (!widget.state.hasMore && _isRequesting) _isRequesting = false;
  }

  void _maybeRequestMore(int index) {
    if (_isRequesting || !widget.state.hasMore || widget.items.isEmpty) return;

    final int triggerIndex = (widget.items.length - widget.preloadThreshold).clamp(
      0,
      widget.items.length - 1,
    );

    if (index != triggerIndex) return;

    _isRequesting = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      setState(() {});

      widget.onNextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool showLoader = _isRequesting && widget.state.hasMore;
    final int itemCount = widget.items.length + (showLoader ? 1 : 0);

    return SliverList.separated(
      itemCount: itemCount,
      separatorBuilder: (BuildContext context, int index) =>
          widget.separatorBuilder(context, index),
      itemBuilder: (BuildContext context, int index) {
        if (index < widget.items.length) {
          _maybeRequestMore(index);

          return widget.itemBuilder(context, widget.items[index], index);
        }

        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: AppCircularLoadingIndicator(),
        );
      },
    );
  }
}
