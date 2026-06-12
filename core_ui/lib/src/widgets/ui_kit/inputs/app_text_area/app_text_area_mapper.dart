import 'package:core_ui/core_ui.dart';

class AppTextAreaMapper {
  static Color getTextColor({
    required AppColorsTheme colors,
    required AppTextAreaStyle style,
    required bool isDisabled,
  }) {
    final AppTextFieldTheme theme = colors.textField;

    return isDisabled ? theme.textDisabled : theme.text;
  }

  static Color getBackgroundColor({
    required AppColorsTheme colors,
    required AppTextAreaStyle style,
    required bool isDisabled,
  }) {
    final AppTextFieldTheme theme = colors.textField;

    return isDisabled ? theme.backgroundDisabled : theme.background;
  }

  static Color getBorderColor({required AppColorsTheme colors, required AppTextAreaStyle style}) =>
      colors.textField.border;

  static Color getFocusedBorderColor({
    required AppColorsTheme colors,
    required AppTextAreaStyle style,
  }) => colors.textField.borderFocused;

  static Color getErrorBorderColor({
    required AppColorsTheme colors,
    required AppTextAreaStyle style,
  }) => colors.textField.borderError;

  static Color getHintColor({required AppColorsTheme colors, required AppTextAreaStyle style}) =>
      colors.textField.hint;

  static Color getLabelColor({required AppColorsTheme colors, required AppTextAreaStyle style}) =>
      colors.textField.label;

  static Color getCaptionColor({required AppColorsTheme colors, required AppTextAreaStyle style}) =>
      colors.textField.caption;

  static Color getCursorColor({
    required AppColorsTheme colors,
    required AppTextAreaStyle style,
    required bool isError,
  }) => isError ? colors.textField.borderError : colors.textField.cursor;
}
