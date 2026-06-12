import 'package:core_ui/core_ui.dart';
import 'package:flutter/services.dart';

class SearchFieldItem {
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;

  const SearchFieldItem({required this.label, this.prefix, this.suffix, this.onTap});
}

class AppSearchField extends StatefulWidget {
  final String initialText;
  final String? title;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapOutside;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final List<SearchFieldItem>? suggestions;
  final bool readOnly;
  final bool scrollToTopOnFocus;

  const AppSearchField({
    this.initialText = '',
    this.title,
    this.hint,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onTapOutside,
    this.onTap,
    this.focusNode,
    this.suggestions,
    this.readOnly = false,
    this.scrollToTopOnFocus = false,
    super.key,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController _internalController;
  late FocusNode _focusNode;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    final bool isCombobox = widget.suggestions != null;
    if (widget.onTap != null || (widget.readOnly && !isCombobox)) {
      _focusNode.canRequestFocus = false;
    }
    _focusNode.addListener(_handleFocusChange);
    _internalController = TextEditingController(text: widget.initialText);
    _internalController.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(AppSearchField oldWidget) {
    super.didUpdateWidget(oldWidget);

    final bool isCombobox = widget.suggestions != null;
    final bool oldIsCombobox = oldWidget.suggestions != null;
    if (widget.onTap != oldWidget.onTap ||
        widget.readOnly != oldWidget.readOnly ||
        isCombobox != oldIsCombobox) {
      _focusNode.canRequestFocus = widget.onTap == null && (!widget.readOnly || isCombobox);
    }

    if (widget.suggestions != oldWidget.suggestions) {
      if (_focusNode.hasFocus) {
        _updateOverlay();
      }
    }

    if (widget.initialText != oldWidget.initialText &&
        widget.initialText != _internalController.text) {
      final int cursorPosition = _internalController.selection.baseOffset;
      final int textLength = _internalController.text.length;

      _internalController.text = widget.initialText;

      if (cursorPosition >= textLength || cursorPosition < 0) {
        _internalController.selection = TextSelection.collapsed(offset: widget.initialText.length);
      } else {
        final int newPosition = cursorPosition.clamp(0, widget.initialText.length);
        _internalController.selection = TextSelection.collapsed(offset: newPosition);
      }
    }
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      final bool isCombobox = widget.suggestions != null;
      if (widget.scrollToTopOnFocus && (!widget.readOnly || isCombobox)) {
        Scrollable.ensureVisible(
          context,
          alignment: 0.033,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
      _showOverlay();
    } else {
      _removeOverlay();
    }
    setState(() {});
  }

  void _updateOverlay() => WidgetsBinding.instance.addPostFrameCallback((_) {
    if (!_isDropdownOpen) {
      _showOverlay();
    } else {
      _overlayEntry?.markNeedsBuild();
    }
  });

  void _showOverlay() => WidgetsBinding.instance.addPostFrameCallback((_) {
    if (widget.suggestions == null || widget.suggestions!.isEmpty) {
      _removeOverlay();
      return;
    }

    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      _isDropdownOpen = true;
    } else {
      _overlayEntry!.markNeedsBuild();
    }
  });

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    _isDropdownOpen = false;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (BuildContext _) {
        final AppColorsTheme colors = context.colors;
        final AppTextFieldTheme textFieldTheme = colors.textField;
        final RenderBox renderBox = context.findRenderObject()! as RenderBox;
        final Size size = renderBox.size;

        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, size.height + 2),
            child: TapRegion(
              groupId: _layerLink,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(6),
                color: textFieldTheme.background,
                shadowColor: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: colors.background.secondaryCard,
                    boxShadow: colors.dropdownShadows,
                  ),
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: widget.suggestions!.length,
                    separatorBuilder: (_, _) => const AppDivider(),
                    itemBuilder: (_, int index) {
                      final SearchFieldItem item = widget.suggestions![index];
                      return InkWell(
                        onTap: () {
                          item.onTap?.call();
                          _removeOverlay();
                          _focusNode.unfocus();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            children: <Widget>[
                              if (item.prefix != null) ...<Widget>[
                                item.prefix!,
                                const SizedBox(width: 8),
                              ],
                              Expanded(
                                child: Text(
                                  item.label,
                                  style: AppFonts.b1.copyWith(color: textFieldTheme.text),
                                ),
                              ),
                              if (item.suffix != null) ...<Widget>[
                                const SizedBox(width: 8),
                                item.suffix!,
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    final bool hasFocus = _focusNode.hasFocus;
    final Color borderColor = hasFocus ? colors.textField.borderFocused : colors.textField.border;

    final bool hasText = _internalController.text.isNotEmpty;
    final bool showFloatingLabel = hasText || hasFocus;

    return TapRegion(
      groupId: _layerLink,
      onTapOutside: (_) {
        widget.onTapOutside?.call();
        _focusNode.unfocus();
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: colors.textField.background,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: <Widget>[
              if (widget.prefix != null) ...<Widget>[widget.prefix!, const SizedBox(width: 8)],
              Expanded(
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
                    if (showFloatingLabel && widget.title != null)
                      Positioned(
                        top: 4,
                        left: 0,
                        child: Text(
                          widget.title!,
                          style: AppFonts.caption.copyWith(color: colors.textField.textDisabled),
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: showFloatingLabel ? 20 : 0),
                      child: TextField(
                        controller: _internalController,
                        focusNode: _focusNode,
                        keyboardType: widget.keyboardType,
                        inputFormatters: widget.inputFormatters,
                        readOnly: widget.readOnly || widget.onTap != null,
                        onChanged: widget.onChanged,
                        onTap: widget.onTap,
                        style: AppFonts.b1.copyWith(color: colors.textField.text),
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                          hintText: showFloatingLabel ? null : (widget.hint ?? widget.title),
                          hintStyle: AppFonts.b1.copyWith(color: colors.textField.textDisabled),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (widget.suffix != null) ...<Widget>[const SizedBox(width: 8), widget.suffix!],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    if (widget.focusNode == null) _focusNode.dispose();
    _internalController.removeListener(_handleFocusChange);
    _internalController.dispose();
    _removeOverlay();
    super.dispose();
  }
}
