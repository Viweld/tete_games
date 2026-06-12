import 'package:core_ui/core_ui.dart';

class AppTextButtonMapper {
  static Color getContentColor({
    required AppColorsTheme colors,
    required AppTextButtonStyle style,
    required ElementState state,
  }) {
    final AppTextButtonTheme theme = colors.textButton;

    if (state == ElementState.disabled) return theme.contentDisabled.main;

    return switch (style) {
      AppTextButtonStyle.primary => theme.contentDefault.main,
      AppTextButtonStyle.red => theme.contentDefault.red,
    };
  }

  static TextStyle getTextStyle({required AppTextButtonSize size}) {
    return switch (size) {
      AppTextButtonSize.normal => AppFonts.button,
    };
  }

  static double getHeight({required AppTextButtonSize size}) {
    return switch (size) {
      AppTextButtonSize.normal => 40,
    };
  }

  static double getRadius({required AppTextButtonSize size}) {
    return switch (size) {
      AppTextButtonSize.normal => 6,
    };
  }

  static double getHorizontalPadding({required AppTextButtonSize size}) {
    return switch (size) {
      AppTextButtonSize.normal => 16,
    };
  }
}
