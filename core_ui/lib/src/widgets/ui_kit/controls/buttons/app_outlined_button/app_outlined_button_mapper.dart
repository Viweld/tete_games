import 'package:core_ui/core_ui.dart';

class AppOutlinedButtonMapper {
  static Color getBorderColor({
    required AppColorsTheme colors,
    required AppOutlinedButtonStyle style,
  }) {
    final AppOutlinedButtonTheme theme = colors.outlinedButton;

    return switch (style) {
      AppOutlinedButtonStyle.primary => theme.borderDefault.main,
      AppOutlinedButtonStyle.error => theme.borderDefault.error,
    };
  }

  static Color getContentColor({
    required AppColorsTheme colors,
    required AppOutlinedButtonStyle style,
    required ElementState state,
  }) {
    final AppOutlinedButtonTheme theme = colors.outlinedButton;

    if (state == ElementState.disabled) return theme.contentDisabled.main;

    return switch (style) {
      AppOutlinedButtonStyle.primary => theme.contentDefault.main,
      AppOutlinedButtonStyle.error => theme.contentDefault.error,
    };
  }

  static TextStyle getTextStyle({required AppOutlinedButtonSize size}) {
    return switch (size) {
      AppOutlinedButtonSize.normal => AppFonts.button,
    };
  }

  static double getHeight({required AppOutlinedButtonSize size}) {
    return switch (size) {
      AppOutlinedButtonSize.normal => 40,
    };
  }

  static double getRadius({required AppOutlinedButtonSize size}) {
    return switch (size) {
      AppOutlinedButtonSize.normal => 6,
    };
  }

  static double getHorizontalPadding({required AppOutlinedButtonSize size}) {
    return switch (size) {
      AppOutlinedButtonSize.normal => 16,
    };
  }
}
