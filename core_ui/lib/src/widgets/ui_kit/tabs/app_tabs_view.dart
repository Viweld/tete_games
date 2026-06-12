import 'package:core_ui/core_ui.dart';

class AppTabItem<T> {
  final T id;
  final String title;
  final AppIcon? icon;
  final Widget? leading;

  const AppTabItem({required this.id, required this.title, this.icon, this.leading});
}

class AppTabsView<T> extends StatefulWidget {
  final List<AppTabItem<T>> tabs;
  final Widget Function(BuildContext context, T tab) builder;
  final T? selectedId;
  final int initialIndex;
  final ValueChanged<T>? onTabSelected;
  final ValueChanged<T>? onTabChanged;

  const AppTabsView({
    super.key,
    required this.tabs,
    required this.builder,
    this.selectedId,
    this.initialIndex = 0,
    this.onTabSelected,
    this.onTabChanged,
  }) : assert(tabs.length > 0, 'AppTabsView: tabs must not be empty');

  @override
  State<AppTabsView<T>> createState() => _AppTabsViewState<T>();
}

class _AppTabsViewState<T> extends State<AppTabsView<T>> {
  late final PageController _pageController;

  late int _selectedIndex;
  int? _animatingToIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _initialSelectedIndex();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  int _initialSelectedIndex() {
    final int safeInitialIndex = widget.initialIndex.clamp(0, widget.tabs.length - 1);
    final T? selectedId = widget.selectedId;
    if (selectedId == null) return safeInitialIndex;

    final int selectedIndex = widget.tabs.indexWhere((AppTabItem<T> e) => e.id == selectedId);
    return selectedIndex == -1 ? safeInitialIndex : selectedIndex;
  }

  int? _indexForId(T id) {
    final int index = widget.tabs.indexWhere((AppTabItem<T> e) => e.id == id);
    return index == -1 ? null : index;
  }

  @override
  void didUpdateWidget(covariant AppTabsView<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final T? selectedId = widget.selectedId;
    if (selectedId == null) return;

    final int? nextIndex = _indexForId(selectedId);
    if (nextIndex == null || nextIndex == _selectedIndex) return;

    _animatingToIndex = nextIndex;
    _selectedIndex = nextIndex;

    _pageController
        .animateToPage(
          nextIndex,
          duration: AppDimens.defaultAnimationDuration,
          curve: Curves.easeInOut,
        )
        .then((_) {
          if (!mounted) return;
          _animatingToIndex = null;
        });
  }

  void _onTabTap(int index) {
    if (_animatingToIndex != null) return;

    _animatingToIndex = index;
    setState(() => _selectedIndex = index);

    widget.onTabSelected?.call(widget.tabs[index].id);

    _pageController
        .animateToPage(index, duration: AppDimens.defaultAnimationDuration, curve: Curves.easeInOut)
        .then((_) {
          if (!mounted) return;
          _animatingToIndex = null;
        });
  }

  void _onPageChanged(int index) {
    if (_animatingToIndex != null && index != _animatingToIndex) return;

    setState(() => _selectedIndex = index);
    widget.onTabChanged?.call(widget.tabs[index].id);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: <Widget>[
        _TabsHeader<T>(tabs: widget.tabs, selectedIndex: _selectedIndex, onTabSelected: _onTabTap),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: _onPageChanged,
            itemCount: widget.tabs.length,
            itemBuilder: (BuildContext context, int index) =>
                widget.builder(context, widget.tabs[index].id),
          ),
        ),
      ],
    );
  }
}

class _TabsHeader<T> extends StatelessWidget {
  final List<AppTabItem<T>> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;

  const _TabsHeader({required this.tabs, required this.selectedIndex, required this.onTabSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultHorizontalPadding),
      child: Row(
        spacing: 20,
        children: List<Widget>.generate(tabs.length, (int index) {
          final AppTabItem<T> tab = tabs[index];

          return Expanded(
            child: _TabItem(
              title: tab.title,
              icon: tab.icon,
              leading: tab.leading,
              isSelected: selectedIndex == index,
              onTap: () => onTabSelected(index),
            ),
          );
        }),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String title;
  final AppIcon? icon;
  final Widget? leading;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? colors.icons.accent : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (leading != null || icon != null) ...<Widget>[
                leading ??
                    icon!.call(
                      size: 20,
                      color: isSelected ? colors.icons.main : colors.text.secondary,
                    ),
                const SizedBox(width: 8),
              ],

              Text(
                title,
                style: AppFonts.label.copyWith(
                  color: isSelected ? colors.text.main : colors.text.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
