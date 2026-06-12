import 'package:core_ui/core_ui.dart';

class AppElevatedButtonMapper {
  static Color getBackgroundColor({
    required AppColorsTheme colors,
    required AppElevatedButtonStyle style,
    required ElementState state,
  }) {
    final AppElevatedButtonTheme theme = colors.elevatedButton;

    switch (state) {
      case ElementState.enabled:
      case ElementState.loading:
        return switch (style) {
          AppElevatedButtonStyle.primary => theme.backgroundDefault.main,
          AppElevatedButtonStyle.red => theme.backgroundDefault.red,
          AppElevatedButtonStyle.accent => theme.backgroundDefault.accent,
        };
      case ElementState.disabled:
        return switch (style) {
          AppElevatedButtonStyle.primary => theme.backgroundDisabled.main,
          AppElevatedButtonStyle.red => theme.backgroundDisabled.main,
          AppElevatedButtonStyle.accent => theme.backgroundDisabled.main,
        };
    }
  }

  static Color getContentColor({
    required AppColorsTheme colors,
    required AppElevatedButtonStyle style,
    required ElementState state,
  }) {
    final AppElevatedButtonTheme theme = colors.elevatedButton;

    if (state == ElementState.disabled) return theme.contentDisabled.main;

    return switch (style) {
      AppElevatedButtonStyle.primary => theme.contentDefault.main,
      AppElevatedButtonStyle.red => theme.contentDefault.main,
      AppElevatedButtonStyle.accent => theme.contentDefault.main,
    };
  }

  static TextStyle getTextStyle({required AppElevatedButtonSize size}) {
    return switch (size) {
      AppElevatedButtonSize.normal => AppFonts.button,
    };
  }

  static double getHeight({required AppElevatedButtonSize size}) {
    return switch (size) {
      AppElevatedButtonSize.normal => 40,
    };
  }

  static double getRadius({required AppElevatedButtonSize size}) {
    return switch (size) {
      AppElevatedButtonSize.normal => 6,
    };
  }

  static double getHorizontalPadding({required AppElevatedButtonSize size}) {
    return switch (size) {
      AppElevatedButtonSize.normal => 16,
    };
  }
}
