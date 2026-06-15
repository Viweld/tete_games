import 'package:core_ui/core_ui.dart';
import 'package:flutter/services.dart';

enum AppTextAreaStyle { primary }

class AppTextArea extends StatefulWidget {
  final AppTextAreaStyle style;
  final FieldState state;
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final String? error;
  final String? caption;
  final Widget? postfix;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool isRequired;
  final bool isInverted;
  final double minHeight;
  final int? maxLines;

  const AppTextArea({
    required this.controller,
    this.style = AppTextAreaStyle.primary,
    this.state = FieldState.enabled,
    this.isRequired = false,
    this.isInverted = false,
    this.minHeight = 136,
    this.title,
    this.caption,
    this.postfix,
    this.hint,
    this.error,
    this.keyboardType,
    this.inputFormatters,
    this.maxLines,
    super.key,
  });

  @override
  State<AppTextArea> createState() => _AppTextAreaState();
}

class _AppTextAreaState extends State<AppTextArea> {
  bool _isActive = false;
  late bool _isNotEmpty;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
    widget.controller.addListener(_handleFocusChange);
    _isNotEmpty = widget.controller.text.isNotEmpty;
  }

  void _handleFocusChange() {
    setState(() => _isNotEmpty = widget.controller.text.isNotEmpty);
    if (_isActive && !_focusNode.hasFocus) {
      setState(() => _isActive = false);
    } else {
      setState(() {
        _isActive = true;
        _isNotEmpty = widget.controller.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String? maybeError = widget.error != null && (widget.error?.isNotEmpty ?? false)
        ? widget.error
        : null;

    final bool isDisabled = widget.state == FieldState.disabled;

    final Color baseBorder = colors.textField.border;
    final Color focusBorder = colors.textField.borderFocused;
    final Color errorBorder = colors.textField.borderError;

    final bool hasText = widget.controller.text.isNotEmpty;
    final bool hasHint = (widget.hint != null) && widget.hint!.isNotEmpty;
    final bool shouldShowHintInside = !hasText && hasHint;

    final Color borderColor = maybeError != null
        ? errorBorder
        : _focusNode.hasFocus
        ? focusBorder
        : baseBorder;

    final Color backgroundColor = isDisabled
        ? colors.textField.backgroundDisabled
        : (_isActive
              ? colors.textField.backgroundFocused
              : (widget.isInverted
                    ? colors.background.secondaryCard
                    : colors.textField.background));

    final Color cursorColor = maybeError != null ? errorBorder : colors.textField.cursor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: _isActive
              ? null
              : () {
                  _focusNode.requestFocus();

                  setState(() => _isActive = true);
                },
          behavior: HitTestBehavior.opaque,
          child: Container(
            constraints: BoxConstraints(minHeight: widget.minHeight),
            padding: const EdgeInsets.all(AppDimens.defaultHorizontalPadding),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if ((widget.title ?? widget.hint) != null) ...<Widget>[
                  Text(
                    widget.isRequired
                        ? '${(widget.title ?? widget.hint)!} *'
                        : (widget.title ?? widget.hint)!,
                    style: _isNotEmpty || _isActive
                        ? AppFonts.h3.copyWith(color: colors.textField.label)
                        : AppFonts.h3.copyWith(color: colors.textField.label),
                  ),
                ],
                if (_isActive || _isNotEmpty) ...<Widget>[
                  const SizedBox(height: 2),
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: <Widget>[
                      TextField(
                        controller: widget.controller,
                        focusNode: _focusNode,
                        keyboardType: widget.keyboardType,
                        inputFormatters: widget.inputFormatters,
                        cursorColor: cursorColor,
                        enabled: !isDisabled,
                        style: AppFonts.h2.copyWith(
                          color: isDisabled ? colors.textField.textDisabled : colors.textField.text,
                        ),
                        minLines: 2,
                        maxLines: widget.maxLines,
                        decoration: InputDecoration(
                          filled: false,
                          border: InputBorder.none,
                          counterText: '',
                          errorStyle: AppFonts.base.copyWith(fontSize: 0, height: 0),
                          contentPadding: EdgeInsets.only(right: widget.postfix != null ? 32 : 0),
                          hintText: widget.controller.text.isEmpty ? widget.hint : null,
                          hintStyle: !shouldShowHintInside
                              ? AppFonts.h3.copyWith(color: colors.textField.label)
                              : AppFonts.h2.copyWith(color: colors.textField.hint),
                        ),
                      ),
                      if (widget.postfix != null)
                        Positioned(
                          top: -4,
                          right: 0,
                          child: SizedBox(height: 24, width: 24, child: widget.postfix),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        if (maybeError != null) ...<Widget>[
          const SizedBox(height: 4),
          Text(
            maybeError,
            style: AppFonts.h3.copyWith(color: colors.textField.borderError),
            maxLines: 1,
          ),
        ] else if (widget.caption != null) ...<Widget>[
          const SizedBox(height: 4),
          Text(
            widget.caption!,
            style: AppFonts.h3.copyWith(color: colors.textField.caption),
            maxLines: 1,
          ),
        ],
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    widget.controller.removeListener(_handleFocusChange);

    super.dispose();
  }
}
