import 'package:core_ui/core_ui.dart';

class AppCarouselTabs<T> extends StatefulWidget {
  final List<AppTabItem<T>> tabs;
  final T selectedId;
  final ValueChanged<T> onSelected;

  final double height;
  final double viewportFraction;

  const AppCarouselTabs({
    super.key,
    required this.tabs,
    required this.selectedId,
    required this.onSelected,
    this.height = 40,
    this.viewportFraction = 0.4,
  }) : assert(tabs.length > 0, 'AppCarouselTabs: tabs must not be empty');

  @override
  State<AppCarouselTabs<T>> createState() => _AppCarouselTabsState<T>();
}

class _AppCarouselTabsState<T> extends State<AppCarouselTabs<T>> {
  static const int _virtualItemCount = 1000000;
  static const int _virtualMiddle = _virtualItemCount ~/ 2;

  late final PageController _controller;

  bool _suppressOnPageChanged = false;

  int get _tabsCount => widget.tabs.length;

  int _realIndexForVirtual(int index) => index % _tabsCount;

  int _indexForId(T id) {
    final int idx = widget.tabs.indexWhere((AppTabItem<T> t) => t.id == id);
    return idx == -1 ? 0 : idx;
  }

  int _initialVirtualPage() =>
      _virtualMiddle - (_virtualMiddle % _tabsCount) + _indexForId(widget.selectedId);

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: _initialVirtualPage(),
    );
  }

  @override
  void didUpdateWidget(covariant AppCarouselTabs<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedId == widget.selectedId) return;

    final int target =
        _virtualMiddle - (_virtualMiddle % _tabsCount) + _indexForId(widget.selectedId);
    _suppressOnPageChanged = true;
    _controller
        .animateToPage(
          target,
          duration: AppDimens.defaultAnimationDuration,
          curve: Curves.easeInOut,
        )
        .then((_) {
          if (!mounted) return;
          _suppressOnPageChanged = false;
        });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return SizedBox(
      height: widget.height,
      child: ShaderMask(
        shaderCallback: (Rect rect) => const LinearGradient(
          colors: <Color>[Colors.transparent, Colors.black, Colors.black, Colors.transparent],
          stops: <double>[0.0, 0.15, 0.85, 1.0],
        ).createShader(rect),
        blendMode: BlendMode.dstIn,
        child: PageView.builder(
          controller: _controller,
          physics: const PageScrollPhysics(),
          itemCount: _virtualItemCount,
          onPageChanged: (int virtualIndex) {
            if (_suppressOnPageChanged) return;
            final AppTabItem<T> tab = widget.tabs[_realIndexForVirtual(virtualIndex)];
            widget.onSelected(tab.id);
          },
          itemBuilder: (BuildContext context, int virtualIndex) {
            final AppTabItem<T> tab = widget.tabs[_realIndexForVirtual(virtualIndex)];

            return AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                final double page = _controller.hasClients
                    ? (_controller.page ?? _controller.initialPage.toDouble())
                    : 0;
                final double distance = (virtualIndex - page).abs();

                final double opacity = switch (distance) {
                  <= 0.5 => 1.0,
                  <= 1.5 => 1.0 - ((distance - 0.5) * 0.7),
                  _ => 0.3,
                };

                final double scale = distance <= 0.5
                    ? 1.0
                    : 0.92 + (0.08 * (1.5 - distance).clamp(0.0, 1.0));

                final bool isSelected = distance < 0.5;

                return Opacity(
                  opacity: opacity.clamp(0.0, 1.0),
                  child: Transform.scale(
                    scale: scale,
                    child: _CarouselTabItem<T>(
                      tab: tab,
                      isSelected: isSelected,
                      onTap: () {
                        final int delta = virtualIndex - page.round();
                        final int target = page.round() + delta;
                        _controller.animateToPage(
                          target,
                          duration: AppDimens.defaultAnimationDuration,
                          curve: Curves.easeInOut,
                        );
                        widget.onSelected(tab.id);
                      },
                      selectedColor: colors.icons.accent,
                      textColor: isSelected ? colors.text.main : colors.text.secondary,
                      iconColor: isSelected ? colors.icons.main : colors.text.secondary,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _CarouselTabItem<T> extends StatelessWidget {
  final AppTabItem<T> tab;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color textColor;
  final Color iconColor;

  const _CarouselTabItem({
    required this.tab,
    required this.isSelected,
    required this.onTap,
    required this.selectedColor,
    required this.textColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: isSelected ? selectedColor : Colors.transparent, width: 2),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (tab.leading != null || tab.icon != null) ...<Widget>[
                tab.leading ?? tab.icon!.call(size: 18, color: iconColor),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  tab.title,
                  overflow: TextOverflow.ellipsis,
                  style: AppFonts.label.copyWith(color: textColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
