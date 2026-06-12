import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppPhoneInput extends StatefulWidget {
  /// UI locale; country names in the region list depend on it.
  final Locale locale;
  final String? initialPhone;
  final String? title;
  final String? errorText;
  final bool showError;
  final VoidCallback? onUnfocused;
  final ValueChanged<String>? onChanged;
  final List<String>? allowedRegions;
  final bool scrollToTopOnFocus;

  const AppPhoneInput({
    super.key,
    required this.locale,
    this.initialPhone,
    this.title,
    this.errorText,
    this.showError = true,
    this.onUnfocused,
    this.onChanged,
    this.allowedRegions,
    this.scrollToTopOnFocus = false,
  });

  @override
  State<AppPhoneInput> createState() => _AppPhoneInputState();
}

class _AppPhoneInputState extends State<AppPhoneInput> {
  late final TextEditingController _controller;
  late FocusNode _focusNode;
  bool _focused = false;

  late List<CountryPhoneData> _availableCountries;
  late CountryPhoneData _selectedCountry;
  late MaskTextInputFormatter _maskFormatter;

  bool _isDropdownOpen = false;
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _selectorKey = GlobalKey();

  String _countrySearchQuery = '';
  bool _suppressPhoneNotification = false;

  List<CountryPhoneData> _sortedByLocalizedName(List<CountryPhoneData> input) {
    final List<CountryPhoneData> list = List<CountryPhoneData>.of(input);
    list.sort((CountryPhoneData a, CountryPhoneData b) {
      final int byName = a.name.toLowerCase().compareTo(b.name.toLowerCase());
      if (byName != 0) return byName;
      final int byDial = a.dialCode.compareTo(b.dialCode);
      if (byDial != 0) return byDial;
      return a.isoCode.compareTo(b.isoCode);
    });
    return list;
  }

  List<CountryPhoneData> _filterCountriesByQuery(List<CountryPhoneData> input, String query) {
    final String q = query.trim().toLowerCase();
    if (q.isEmpty) return input;

    final String queryDigits = q.replaceAll(RegExp(r'[^\d]'), '');

    return input.where((CountryPhoneData c) {
      final bool nameMatches = c.name.toLowerCase().contains(q);
      if (nameMatches) return true;

      if (queryDigits.isEmpty) return false;
      final String dialDigits = c.dialCode.replaceAll(RegExp(r'[^\d]'), '');
      return dialDigits.startsWith(queryDigits);
    }).toList();
  }

  @override
  void initState() {
    super.initState();

    final CountryPhoneService service = CountryPhoneService();

    // Filter by allowed regions
    if (widget.allowedRegions != null && widget.allowedRegions!.isNotEmpty) {
      _availableCountries = _sortedByLocalizedName(
        service.filterByIsoCodes(widget.allowedRegions!, widget.locale),
      );
    } else {
      _availableCountries = _sortedByLocalizedName(service.countries(widget.locale));
    }

    // Resolve initial region
    if (widget.initialPhone != null && widget.initialPhone!.isNotEmpty) {
      final CountryPhoneData? detected = service.findByPhoneNumber(
        widget.initialPhone!,
        widget.locale,
      );
      _selectedCountry = detected ?? _availableCountries.first;
    } else {
      // Default to Russia when available
      _selectedCountry = _availableCountries.firstWhere(
        (CountryPhoneData c) => c.isoCode == 'RU',
        orElse: () => _availableCountries.first,
      );
    }

    _maskFormatter = _createMaskFormatter(_selectedCountry.phoneMask);

    // Extract local number from the full phone number
    final String localNumber = _extractLocalNumber(widget.initialPhone);
    _controller = TextEditingController(text: _maskFormatter.maskText(localNumber));
    _controller.addListener(_handleTextChange);

    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);

    service.ensureInitialized().then((_) {
      if (!mounted) return;
      final CountryPhoneService service = CountryPhoneService();
      final List<CountryPhoneData> next;
      if (widget.allowedRegions != null && widget.allowedRegions!.isNotEmpty) {
        next = service.filterByIsoCodes(widget.allowedRegions!, widget.locale);
      } else {
        next = service.countries(widget.locale);
      }
      final List<CountryPhoneData> sortedNext = _sortedByLocalizedName(next);
      if (sortedNext.isEmpty) return;

      // Exclude Ascension Island — unused and confusing for users
      sortedNext.removeWhere((CountryPhoneData e) => e.isoCode == 'AC');

      final CountryPhoneData selected = _reselectCountry(
        service: service,
        next: sortedNext,
        initialPhone: widget.initialPhone,
      );

      final String localDigits = _extractLocalNumber(widget.initialPhone, forCountry: selected);
      final bool userHasInput = _maskFormatter.getUnmaskedText().isNotEmpty;

      setState(() {
        _availableCountries = sortedNext;
        _selectedCountry = selected;
        _maskFormatter = _createMaskFormatter(selected.phoneMask);
        if (!userHasInput) {
          _setControllerText(_maskFormatter.maskText(localDigits));
        }
      });
    });
  }

  CountryPhoneData _reselectCountry({
    required CountryPhoneService service,
    required List<CountryPhoneData> next,
    required String? initialPhone,
  }) {
    if (initialPhone != null && initialPhone.isNotEmpty) {
      final CountryPhoneData? detected = service.findByPhoneNumber(initialPhone, widget.locale);
      if (detected != null) {
        return next.firstWhere(
          (CountryPhoneData c) => c.isoCode == detected.isoCode && c.dialCode == detected.dialCode,
          orElse: () => next.first,
        );
      }
    }

    final String selectedIso = _selectedCountry.isoCode;
    final String selectedDial = _selectedCountry.dialCode;
    return next.firstWhere(
      (CountryPhoneData c) => c.isoCode == selectedIso && c.dialCode == selectedDial,
      orElse: () =>
          next.firstWhere((CountryPhoneData c) => c.isoCode == 'RU', orElse: () => next.first),
    );
  }

  @override
  void didUpdateWidget(AppPhoneInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialPhone != widget.initialPhone) {
      _syncExternalInitialPhone(widget.initialPhone);
    }

    final bool localeChanged = oldWidget.locale != widget.locale;
    final bool regionsChanged = !listEquals(oldWidget.allowedRegions, widget.allowedRegions);
    if (!localeChanged && !regionsChanged) return;

    final CountryPhoneService service = CountryPhoneService();
    final List<CountryPhoneData> next;
    if (widget.allowedRegions != null && widget.allowedRegions!.isNotEmpty) {
      next = service.filterByIsoCodes(widget.allowedRegions!, widget.locale);
    } else {
      next = service.countries(widget.locale);
    }
    final List<CountryPhoneData> sortedNext = _sortedByLocalizedName(next);
    if (sortedNext.isEmpty) return;

    setState(() {
      _availableCountries = sortedNext;
      _selectedCountry = _reselectCountry(
        service: service,
        next: sortedNext,
        initialPhone: widget.initialPhone,
      );
    });
  }

  void _setControllerText(String text) {
    _suppressPhoneNotification = true;
    try {
      _controller.text = text;
    } finally {
      _suppressPhoneNotification = false;
    }
  }

  void _syncExternalInitialPhone(String? fullPhone) {
    if (_matchesExternalPhone(fullPhone)) return;

    if (fullPhone == null || fullPhone.isEmpty) {
      if (!_focusNode.hasFocus) {
        _setControllerText(_maskFormatter.maskText(''));
      }
      return;
    }

    final CountryPhoneService service = CountryPhoneService();
    final CountryPhoneData selected = _reselectCountry(
      service: service,
      next: _availableCountries,
      initialPhone: fullPhone,
    );
    final String localDigits = _extractLocalNumber(fullPhone, forCountry: selected);

    setState(() {
      _selectedCountry = selected;
      _maskFormatter = _createMaskFormatter(selected.phoneMask);
      _setControllerText(_maskFormatter.maskText(localDigits));
    });
  }

  String _normalizedPhoneDigits(String? value) {
    if (value == null || value.isEmpty) return '';
    return '+${value.replaceAll(RegExp(r'[^\d]'), '')}';
  }

  String _currentFullPhone() {
    final String unmasked = _maskFormatter.getUnmaskedText();
    if (unmasked.isEmpty) return '';
    final String dialDigits = _selectedCountry.dialCode.replaceAll(RegExp(r'[^\d]'), '');
    return '+$dialDigits$unmasked';
  }

  bool _matchesExternalPhone(String? externalPhone) {
    final String external = _normalizedPhoneDigits(externalPhone);
    final String current = _currentFullPhone();

    if (external.isEmpty) {
      return _maskFormatter.getUnmaskedText().isEmpty;
    }
    if (current.isEmpty) {
      final String dialOnly = _normalizedPhoneDigits(_selectedCountry.dialCode);
      return external == dialOnly;
    }
    return external == current;
  }

  MaskTextInputFormatter _createMaskFormatter(String mask) {
    return MaskTextInputFormatter(mask: mask, filter: <String, RegExp>{'#': RegExp('[0-9]')});
  }

  String _extractLocalNumber(String? fullPhone, {CountryPhoneData? forCountry}) {
    if (fullPhone == null || fullPhone.isEmpty) return '';
    final CountryPhoneData country = forCountry ?? _selectedCountry;
    final String digits = fullPhone.replaceAll(RegExp(r'[^\d]'), '');
    final String dialDigits = country.dialCode.replaceAll(RegExp(r'[^\d]'), '');
    if (digits.startsWith(dialDigits)) {
      return digits.substring(dialDigits.length);
    }
    return digits;
  }

  void _handleFocusChange() {
    if (_focused == _focusNode.hasFocus) return;
    _focused = _focusNode.hasFocus;
    if (!_focused) {
      widget.onUnfocused?.call();
    }
    setState(() {});
  }

  void _handleTextChange() {
    if (_suppressPhoneNotification) return;
    _notifyPhoneChanged();
    setState(() {});
  }

  void _notifyPhoneChanged() {
    if (widget.onChanged == null) return;
    final String unmasked = _maskFormatter.getUnmaskedText();
    final String dialDigits = _selectedCountry.dialCode.replaceAll(RegExp(r'[^\d]'), '');
    widget.onChanged!('$dialDigits$unmasked');
  }

  void _onCountrySelected(CountryPhoneData country) {
    _closeDropdown();

    if (country.isoCode == _selectedCountry.isoCode &&
        country.dialCode == _selectedCountry.dialCode) {
      return;
    }

    setState(() {
      _selectedCountry = country;
      _maskFormatter = _createMaskFormatter(country.phoneMask);
      _setControllerText(_maskFormatter.maskText(_maskFormatter.getUnmaskedText()));
    });

    _notifyPhoneChanged();
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
    _countrySearchQuery = '';
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

  OverlayEntry _buildOverlayEntry() {
    const double itemHeight = 40.0;
    const double searchHeaderHeight = 56.0;
    const int maxVisibleItems = 8;

    return OverlayEntry(
      builder: (BuildContext context) {
        final AppColorsTheme colors = context.colors;
        final AppLocalization localization = context.localization;
        final RenderBox? renderBox = _selectorKey.currentContext?.findRenderObject() as RenderBox?;
        final Size size = renderBox?.size ?? const Size(0, 40);

        final List<CountryPhoneData> visibleCountries = _filterCountriesByQuery(
          _availableCountries,
          _countrySearchQuery,
        );
        final int itemCount = visibleCountries.length;
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
                              initialText: _countrySearchQuery,
                              hint: localization.citizenship_search_placeholder,
                              onChanged: (String value) {
                                _countrySearchQuery = value;
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
                                final CountryPhoneData country = visibleCountries[index];
                                final bool isSelected =
                                    country.isoCode == _selectedCountry.isoCode &&
                                    country.dialCode == _selectedCountry.dialCode;

                                return _PhoneRegionListItem(
                                  country: country,
                                  isSelected: isSelected,
                                  onTap: () => _onCountrySelected(country),
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
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    const bool isDisabled = false;

    final Color baseBorder = colors.textField.border;
    final Color focusBorder = colors.textField.borderFocused;
    final Color errorBorder = colors.textField.borderError;

    final bool hasError =
        widget.showError && widget.errorText != null && widget.errorText!.isNotEmpty;

    final Color backgroundColor = _focusNode.hasFocus
        ? colors.textField.backgroundFocused
        : colors.textField.background;

    final Color cursorColor = hasError ? errorBorder : colors.textField.cursor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (widget.title != null) ...<Widget>[
          Text(widget.title ?? '', style: AppFonts.b4.copyWith(color: colors.text.main)),
          const SizedBox(height: 14),
        ],
        CompositedTransformTarget(
          key: _selectorKey,
          link: _layerLink,
          child: SizedBox(
            height: 40,
            child: Row(
              spacing: 8,
              children: <Widget>[
                GestureDetector(
                  onTap: _toggleDropdown,
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: hasError
                            ? errorBorder
                            : (_focusNode.hasFocus ? focusBorder : baseBorder),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        AppCircleFlag(countryCode: _selectedCountry.isoCode),
                        const SizedBox(width: 4),
                        Icon(
                          _isDropdownOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                          size: 16,
                          color: colors.icons.main,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[_maskFormatter],
                    cursorColor: cursorColor,
                    enabled: !isDisabled,
                    style: AppFonts.b1.copyWith(color: colors.textField.text),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: _selectedCountry.phoneMask.replaceAll('#', '0'),
                      hintStyle: AppFonts.b1.copyWith(color: colors.textField.hint),
                      filled: true,
                      fillColor: backgroundColor,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: hasError ? errorBorder : baseBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: hasError ? errorBorder : baseBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: hasError ? errorBorder : focusBorder),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: errorBorder),
                      ),
                      prefixIconConstraints: const BoxConstraints(minWidth: 12),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          '${_selectedCountry.dialCode} ',
                          style: AppFonts.b1.copyWith(color: colors.textField.text),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
            child: Text(
              widget.errorText!,
              style: AppFonts.caption.copyWith(color: colors.textField.borderError),
              maxLines: 1,
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    super.dispose();
  }
}

class _PhoneRegionListItem extends StatelessWidget {
  final CountryPhoneData country;
  final bool isSelected;
  final VoidCallback onTap;

  const _PhoneRegionListItem({
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
            AppCircleFlag(countryCode: country.isoCode),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                country.name,
                style: AppFonts.b2.copyWith(color: colors.textButton.contentDefault.main),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Text(country.dialCode, style: AppFonts.b2.copyWith(color: colors.text.secondary)),
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
