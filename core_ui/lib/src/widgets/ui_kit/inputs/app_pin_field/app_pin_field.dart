import 'package:core_ui/core_ui.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class AppPinField extends StatefulWidget {
  final FieldState state;
  final String? error;
  final ValueChanged<String>? onChanged;

  const AppPinField({super.key, this.state = FieldState.enabled, this.error, this.onChanged});

  @override
  State<AppPinField> createState() => _AppPinFieldState();
}

class _AppPinFieldState extends State<AppPinField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.unfocus();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String? maybeError = widget.error != null && (widget.error?.isNotEmpty ?? false)
        ? widget.error
        : null;

    return Pinput(
      focusNode: _focusNode,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      forceErrorState: maybeError != null,
      autofocus: true,
      onChanged: widget.onChanged,
      length: 6,
      cursor: Container(height: 15, width: 2, color: colors.pinfield.cursor),
      defaultPinTheme: getPinThemeWithColor(
        color: colors.pinfield.border,
        textStyle: AppFonts.b1.copyWith(height: 1, color: colors.pinfield.text),
      ),
      focusedPinTheme: getPinThemeWithColor(
        color: colors.pinfield.borderFocused,
        isActive: true,
        textStyle: AppFonts.b1.copyWith(height: 1, color: colors.pinfield.text),
      ),
      errorPinTheme: getPinThemeWithColor(
        color: colors.pinfield.borderError,
        textStyle: AppFonts.b1.copyWith(height: 1, color: colors.pinfield.text),
      ),
      errorText: maybeError,
      inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
      errorBuilder: (String? errorText, String pin) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          child: Align(
            child: Text(
              errorText ?? maybeError ?? '',
              style: AppFonts.caption.copyWith(color: colors.pinfield.textError),
            ),
          ),
        );
      },
    );
  }

  PinTheme getPinThemeWithColor({
    required Color color,
    required TextStyle textStyle,
    double borderWidth = 1,
    bool isActive = false,
  }) {
    return PinTheme(
      width: 44,
      height: 40,
      textStyle: textStyle,
      decoration: BoxDecoration(
        border: Border.all(color: color, width: borderWidth),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
