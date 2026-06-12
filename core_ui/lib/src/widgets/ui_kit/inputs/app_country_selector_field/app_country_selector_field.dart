import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';

/// Country (citizenship) selector with searchable dropdown, similar to [AppPhoneInput].
class AppCountrySelectorField extends StatefulWidget {
  final String? title;
  final String hint;
  final List<Country> countries;
  final Country? selected;
  final ValueChanged<Country> onSelected;
  final String? errorText;
  final bool showError;
  final bool scrollToTopOnFocus;

  const AppCountrySelectorField({
    super.key,
    this.title,
    required this.hint,
    required this.countries,
    required this.selected,
    required this.onSelected,
    this.errorText,
    this.showError = true,
    this.scrollToTopOnFocus = false,
  });

  @override
  State<AppCountrySelectorField> createState() => _AppCountrySelectorFieldState();
}

class _AppCountrySelectorFieldState extends State<AppCountrySelectorField> {
  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _fieldKey = GlobalKey();
  String _searchQuery = '';

  List<Country> _sortedByName(List<Country> input) {
    final List<Country> list = List<Country>.of(input);
    list.sort((Country a, Country b) {
      final int byName = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      if (byName != 0) return byName;
      return a.isoCode.compareTo(b.isoCode);
    });
    return list;
  }

  List<Country> _filterByQuery(List<Country> input, String query) {
    final String q = query.trim().toLowerCase();
    if (q.isEmpty) return input;
    return input
        .where(
          (Country c) => c.name.toLowerCase().contains(q) || c.isoCode.toLowerCase().contains(q),
        )
        .toList();
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _closeDropdown();
    } else {
      if (widget.scrollToTopOnFocus) {
        Scrollable.ensureVisible(
          context,
          alignment: 0.033,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
      _openDropdown();
    }
  }

  void _openDropdown() {
    _searchQuery = '';
    _overlayEntry = _buildOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isDropdownOpen = true);
  }

  void _closeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
    if (mounted) {
      setState(() => _isDropdownOpen = false);
    } else {
      _isDropdownOpen = false;
    }
  }

  void _onCountryTap(Country country) {
    _closeDropdown();
    widget.onSelected(country);
  }

  OverlayEntry _buildOverlayEntry() {
    const double itemHeight = 40.0;
    const double searchHeaderHeight = 56.0;
    const int maxVisibleItems = 8;

    return OverlayEntry(
      builder: (BuildContext context) {
        final AppColorsTheme colors = context.colors;
        final AppLocalization localization = context.localization;
        final RenderBox? renderBox = _fieldKey.currentContext?.findRenderObject() as RenderBox?;
        final Size size = renderBox?.size ?? const Size(0, 40);

        final List<Country> visible = _filterByQuery(_sortedByName(widget.countries), _searchQuery);
        final int itemCount = visible.length;
        final double listHeight = itemCount <= maxVisibleItems
            ? itemCount * itemHeight
            : maxVisibleItems * itemHeight;

        return Stack(
          children: <Widget>[
            Positioned.fill(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _closeDropdown,
                child: const SizedBox.expand(),
              ),
            ),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 2),
              child: SizedBox(
                width: size.width,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  color: colors.background.secondaryCard,
                  child: Container(
                    constraints: BoxConstraints(maxHeight: listHeight + searchHeaderHeight),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colors.textField.border, width: 0.5),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 6),
                            child: AppTextField(
                              initialText: _searchQuery,
                              hint: localization.citizenship_search_placeholder,
                              onChanged: (String value) {
                                _searchQuery = value;
                                _overlayEntry?.markNeedsBuild();
                              },
                              prefix: AppIcons.search.call(size: 24, color: colors.icons.main),
                              showError: false,
                            ),
                          ),
                          Container(height: 0.5, color: colors.textField.border),
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              itemCount: itemCount,
                              itemExtent: itemHeight,
                              physics: itemCount <= maxVisibleItems
                                  ? const NeverScrollableScrollPhysics()
                                  : null,
                              itemBuilder: (BuildContext context, int index) {
                                final Country country = visible[index];
                                final bool isSelected = widget.selected?.id == country.id;

                                return _CountrySelectorListItem(
                                  country: country,
                                  isSelected: isSelected,
                                  onTap: () => _onCountryTap(country),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final Country? selected = widget.selected;

    final Color baseBorder = colors.textField.border;
    final Color focusBorder = colors.textField.borderFocused;
    final Color errorBorder = colors.textField.borderError;

    final bool hasError =
        widget.showError && widget.errorText != null && widget.errorText!.isNotEmpty;

    final Color backgroundColor = _isDropdownOpen
        ? colors.textField.backgroundFocused
        : colors.textField.background;

    final Widget field = CompositedTransformTarget(
      key: _fieldKey,
      link: _layerLink,
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: hasError ? errorBorder : (_isDropdownOpen ? focusBorder : baseBorder),
            ),
          ),
          child: Row(
            children: <Widget>[
              if (selected != null) ...<Widget>[
                AppCircleFlag(countryCode: selected.isoCode, size: 20),
                const SizedBox(width: 8),
              ],
              Expanded(
                child: Text(
                  selected?.name ?? widget.hint,
                  style: AppFonts.b1.copyWith(
                    color: selected != null ? colors.textField.text : colors.textField.hint,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(
                _isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                size: 24,
                color: colors.icons.main,
              ),
            ],
          ),
        ),
      ),
    );

    if (widget.title != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(widget.title!, style: AppFonts.b4.copyWith(color: colors.text.main)),
          const SizedBox(height: 14),
          field,
          if (hasError)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
              child: Text(
                widget.errorText!,
                style: AppFonts.caption.copyWith(color: colors.textField.borderError),
                maxLines: 3,
              ),
            ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        field,
        if (hasError)
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
            child: Text(
              widget.errorText!,
              style: AppFonts.caption.copyWith(color: colors.textField.borderError),
              maxLines: 3,
            ),
          ),
      ],
    );
  }
}

class _CountrySelectorListItem extends StatelessWidget {
  final Country country;
  final bool isSelected;
  final VoidCallback onTap;

  const _CountrySelectorListItem({
    required this.country,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? colors.background.hoverAD : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: <Widget>[
            AppCircleFlag(countryCode: country.isoCode, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                country.name,
                style: AppFonts.b2.copyWith(color: colors.textButton.contentDefault.main),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isSelected) ...<Widget>[
              const SizedBox(width: 8),
              AppIcons.checked.call(size: 20, color: colors.icons.success),
            ],
          ],
        ),
      ),
    );
  }
}
