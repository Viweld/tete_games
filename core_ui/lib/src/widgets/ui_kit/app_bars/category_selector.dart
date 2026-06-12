part of 'app_bars.dart';

class CategorySelector extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<ServiceCategory> onChanged;

  const CategorySelector({super.key, required this.onChanged});

  static const double height = 50;

  @override
  State<CategorySelector> createState() => _CategorySelectorState();

  @override
  Size get preferredSize => const Size.fromHeight(height);
}

class _CategorySelectorState extends State<CategorySelector> {
  final ScrollController _scrollController = ScrollController();
  ServiceCategory _selectedCategory = ServiceCategory.airportServices;
  late final Map<ServiceCategory, GlobalKey> _categoryKeys = <ServiceCategory, GlobalKey>{
    for (final ServiceCategory category in ServiceCategory.values) category: GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.defaultHorizontalPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppDimens.defaultHorizontalPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: <Widget>[
                ...ServiceCategory.values.map(
                  (ServiceCategory category) => CategoryItem(
                    key: _categoryKeys[category],
                    category: category,
                    onTap: () => _onCategorySelected(category),
                    isSelected: _selectedCategory == category,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onCategorySelected(ServiceCategory category) {
    setState(() => _selectedCategory = category);

    widget.onChanged.call(category);

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCategory(category));
  }

  void _scrollToCategory(ServiceCategory category) {
    if (!_scrollController.hasClients) return;

    if (category == ServiceCategory.values.first) {
      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      return;
    }

    final BuildContext? tabContext = _categoryKeys[category]?.currentContext;
    if (tabContext == null) return;

    Scrollable.ensureVisible(
      tabContext,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
