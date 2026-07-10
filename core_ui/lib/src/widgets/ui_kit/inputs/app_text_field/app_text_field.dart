import 'package:core_ui/core_ui.dart';
import 'package:flutter/services.dart';

enum AppTextFieldStyle { primary }

class TextFieldItem {
  final String label;
  final Widget? prefix;
  final Widget? suffix;
  final VoidCallback? onTap;

  const TextFieldItem({required this.label, this.prefix, this.suffix, this.onTap});
}

class AppTextField extends StatefulWidget {
  final AppTextFieldStyle style;
  final FieldState state;
  final String initialText;
  final String? label;
  final String? hint;
  final String? errorText;
  final bool showError;
  final Widget? prefix;
  final List<Widget>? postfixes;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onUnfocused;
  final VoidCallback? onTap;
  final bool canObscure;
  final List<TextFieldItem>? suggestions;
  final VoidCallback? onTapOutside;
  final bool scrollToTopOnFocus;
  final bool readOnly;
  final bool forceShowSuggestions;
  final String? title;

  const AppTextField({
    this.style = AppTextFieldStyle.primary,
    this.state = FieldState.enabled,
    this.canObscure = false,
    this.initialText = '',
    this.label,
    this.prefix,
    this.postfixes,
    this.hint,
    this.errorText,
    this.showError = true,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onUnfocused,
    this.onTap,
    this.suggestions,
    this.onTapOutside,
    this.scrollToTopOnFocus = false,
    this.readOnly = false,
    this.forceShowSuggestions = false,
    this.title,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isObscured = false;
  bool _focused = false;

  final LayerLink _layerLink = LayerLink();
  final Object _tapRegionGroupId = Object();
  final GlobalKey _textFieldKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  bool _isDropdownOpen = false;
  int _overlayShowGeneration = 0;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _controller.addListener(_handleTextChange);
    _focusNode = FocusNode();
    final bool isCombobox = widget.suggestions != null;
    if (widget.onTap != null || (widget.readOnly && !isCombobox)) {
      _focusNode.canRequestFocus = false;
    }
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.canObscure && !widget.canObscure) _isObscured = false;

    final bool isCombobox = widget.suggestions != null;
    final bool oldIsCombobox = oldWidget.suggestions != null;
    if (widget.onTap != oldWidget.onTap ||
        widget.readOnly != oldWidget.readOnly ||
        isCombobox != oldIsCombobox) {
      _focusNode.canRequestFocus = widget.onTap == null && (!widget.readOnly || isCombobox);
    }

    // Update controller text if initialText changed externally
    // but only if it differs from current text to avoid cursor jumping during manual input
    if (widget.initialText != oldWidget.initialText && widget.initialText != _controller.text) {
      final int cursorPosition = _controller.selection.baseOffset;
      final int textLength = _controller.text.length;

      _controller.text = widget.initialText;

      // Preserve cursor position if it's still valid
      // If cursor was at the end, keep it at the end of new text
      if (cursorPosition >= textLength || cursorPosition < 0) {
        // Cursor was at or beyond the end, move to end of new text
        _controller.selection = TextSelection.collapsed(offset: widget.initialText.length);
      } else {
        // Try to preserve cursor position if it's valid in new text
        final int newPosition = cursorPosition.clamp(0, widget.initialText.length);
        _controller.selection = TextSelection.collapsed(offset: newPosition);
      }
    }

    if (widget.suggestions != oldWidget.suggestions && _focusNode.hasFocus) {
      _updateOverlay();
    }

    if (widget.forceShowSuggestions) {
      _updateOverlay();
    } else if (oldWidget.forceShowSuggestions) {
      _removeOverlay();
    }
  }

  void _updateOverlay() {
    if (!mounted) return;
    final int generation = ++_overlayShowGeneration;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || generation != _overlayShowGeneration) return;
      if (!_isDropdownOpen) {
        _showOverlay();
      } else {
        _overlayEntry?.markNeedsBuild();
      }
    });
  }

  void _handleFocusChange() {
    if (_focused == _focusNode.hasFocus) return;
    _focused = _focusNode.hasFocus;
    if (_focused) {
      final bool isCombobox = widget.suggestions != null;
      if (widget.scrollToTopOnFocus && (!widget.readOnly || isCombobox)) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted || !_focusNode.hasFocus) return;
          Scrollable.ensureVisible(
            context,
            alignment: 0.033,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        });
      }
      _updateOverlay();
    } else {
      _removeOverlay();
      widget.onUnfocused?.call();
    }
    setState(() {});
  }

  void _showOverlay() {
    if (!mounted) return;
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
  }

  void _removeOverlay() {
    ++_overlayShowGeneration;
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
    _isDropdownOpen = false;
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (BuildContext overlayContext) {
        final AppColorsTheme colors = context.colors;
        final AppTextFieldTheme textFieldTheme = colors.textField;
        final RenderBox? renderBox = _textFieldKey.currentContext?.findRenderObject() as RenderBox?;
        final Size size = renderBox?.size ?? Size.zero;

        return Positioned(
          width: size.width,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, size.height + 2),
            child: Semantics(
              container: true,
              explicitChildNodes: true,
              child: TapRegion(
                groupId: _tapRegionGroupId,
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
                      separatorBuilder: (_, int index) => const AppDivider(),
                      itemBuilder: (_, int index) {
                        final TextFieldItem item = widget.suggestions![index];
                        return InkWell(
                          key: ValueKey<String>('app_text_field_suggestion_$index:${item.label}'),
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
          ),
        );
      },
    );
  }

  void _handleTextChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final bool isDisabled = widget.state == FieldState.disabled;
    final bool isCombobox = widget.suggestions != null;

    final Color baseBorder = colors.textField.border;
    final Color focusBorder = (widget.readOnly && !isCombobox)
        ? baseBorder
        : colors.textField.borderFocused;
    final Color errorBorder = colors.textField.borderError;

    final bool hasError =
        widget.showError && widget.errorText != null && widget.errorText!.isNotEmpty;

    final bool hasFocus = _focusNode.hasFocus && (!widget.readOnly || isCombobox);

    final Color backgroundColor = isDisabled
        ? colors.textField.backgroundDisabled
        : (hasFocus ? colors.textField.backgroundFocused : colors.textField.background);

    final Color cursorColor = hasError ? errorBorder : colors.textField.cursor;

    final bool hasText = _controller.text.isNotEmpty;
    final bool showLabel = hasText || hasFocus;

    final Widget textFieldMainWidget = TapRegion(
      groupId: _tapRegionGroupId,
      onTapOutside: (_) {
        widget.onTapOutside?.call();
        _focusNode.unfocus();
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              key: _textFieldKey,
              height: 40,
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                obscureText: widget.canObscure && _isObscured,
                keyboardType: widget.keyboardType,
                inputFormatters: widget.inputFormatters,
                textCapitalization: widget.textCapitalization,
                cursorColor: cursorColor,
                enabled: !isDisabled,
                readOnly: widget.readOnly || widget.onTap != null,
                onTap: widget.onTap,
                style: AppFonts.b1.copyWith(
                  color: isDisabled ? colors.textField.textDisabled : colors.textField.text,
                ),
                onChanged: widget.onChanged,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  labelText: showLabel ? widget.label : null,
                  labelStyle: AppFonts.b1.copyWith(
                    color: isDisabled ? colors.textField.textDisabled : colors.textField.label,
                  ),
                  floatingLabelStyle: AppFonts.h6.copyWith(
                    color: hasError ? colors.textField.borderError : colors.textField.label,
                  ),
                  hintText: widget.hint,
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
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(color: colors.textField.backgroundDisabled),
                  ),
                  prefixIconConstraints: const BoxConstraints(minWidth: 12),
                  prefixIcon: widget.prefix == null
                      ? const SizedBox.shrink()
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const SizedBox(width: 12),
                            widget.prefix!,
                            const SizedBox(width: 4),
                          ],
                        ),
                  suffixIconConstraints: const BoxConstraints(minWidth: 12),
                  suffixIcon: _hasTrailingIcons()
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: _collectTrailingIcons(
                            colors: colors,
                            isDisabled: isDisabled,
                            hasFocus: _focusNode.hasFocus,
                          ),
                        )
                      : const SizedBox(width: 6),
                ),
              ),
            ),
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
        ),
      ),
    );

    if (widget.title != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 14,
        children: <Widget>[
          Text(widget.title!, style: AppFonts.b4.copyWith(color: colors.text.main)),
          textFieldMainWidget,
        ],
      );
    }

    return textFieldMainWidget;
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    _removeOverlay();
    super.dispose();
  }

  bool _hasTrailingIcons() =>
      (widget.postfixes != null && widget.postfixes!.isNotEmpty) || widget.canObscure;

  List<Widget> _collectTrailingIcons({
    required AppColorsTheme colors,
    required bool isDisabled,
    required bool hasFocus,
  }) {
    final Color iconColor = isDisabled
        ? colors.textField.textDisabled
        : (hasFocus ? colors.textField.text : colors.textField.label);

    final List<Widget> icons = <Widget>[
      if (widget.postfixes != null) ...widget.postfixes!,
      if (widget.canObscure)
        GestureDetector(
          onTap: () => setState(() => _isObscured = !_isObscured),
          child: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: (_isObscured ? AppIcons.google : AppIcons.apple).call(
              color: iconColor,
              size: 24,
            ),
          ),
        ),
      const SizedBox(width: 6),
    ];

    return icons;
  }
}
