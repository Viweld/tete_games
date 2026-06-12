import 'package:core_ui/core_ui.dart';

class ServiceTabItem {
  final String label;
  final AppIcon icon;
  final VoidCallback onTap;

  const ServiceTabItem({required this.label, required this.icon, required this.onTap});
}

class ServiceTypeTabs extends StatefulWidget {
  final List<ServiceTabItem> tabs;
  final int selectedIndex;

  const ServiceTypeTabs({super.key, required this.tabs, required this.selectedIndex});

  @override
  State<ServiceTypeTabs> createState() => _ServiceTypeTabsState();
}

class _ServiceTypeTabsState extends State<ServiceTypeTabs> {
  final ScrollController _scrollController = ScrollController();
  late final List<GlobalKey> _tabKeys;
  bool _showLeftGradient = false;
  bool _showRightGradient = true;

  @override
  void initState() {
    super.initState();
    _tabKeys = List<GlobalKey>.generate(widget.tabs.length, (_) => GlobalKey());
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) => _onScroll());
  }

  @override
  void didUpdateWidget(ServiceTypeTabs oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.tabs.length != widget.tabs.length) {
      _tabKeys = List<GlobalKey>.generate(widget.tabs.length, (_) => GlobalKey());
    }

    if (oldWidget.selectedIndex != widget.selectedIndex) {
      _scrollToSelectedTab();
    }
  }

  void _scrollToSelectedTab() {
    final GlobalKey key = _tabKeys[widget.selectedIndex];
    final BuildContext? tabContext = key.currentContext;
    if (tabContext == null) return;

    Scrollable.ensureVisible(
      tabContext,
      alignment: 0.5,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final double offset = _scrollController.offset;
    final double maxExtent = _scrollController.position.maxScrollExtent;

    setState(() {
      _showLeftGradient = offset > 0;
      _showRightGradient = offset < maxExtent;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List<Widget>.generate(
              widget.tabs.length,
              (int index) => _ServiceTabWidget(
                key: _tabKeys[index],
                item: widget.tabs[index],
                isSelected: index == widget.selectedIndex,
              ),
            ),
          ),
        ),
        if (_showLeftGradient)
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      colors.background.main,
                      colors.background.main.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (_showRightGradient)
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                width: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: <Color>[
                      colors.background.main,
                      colors.background.main.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ServiceTabWidget extends StatelessWidget {
  final ServiceTabItem item;
  final bool isSelected;

  const _ServiceTabWidget({super.key, required this.item, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: item.onTap,
        child: Container(
          height: 36,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? colors.icons.accent : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: <Widget>[
              item.icon.call(
                size: 20,
                color: isSelected ? colors.icons.main : colors.text.secondary,
              ),
              Text(
                item.label,
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
