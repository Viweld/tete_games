part of 'theme.dart';

final WidgetStateProperty<Color?> _buttonPressedOverlayColor =
    WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
      if (states.contains(WidgetState.pressed)) {
        return AppColors.bgdButtonPressedAD;
      }
      return null;
    });

abstract class AppTheme {
  factory AppTheme.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;

    final AppTheme result = brightness == Brightness.light ? const LightTheme() : const DarkTheme();

    return result;
  }

  ThemeData get theme;

  AppColorsTheme get colors;
}

class LightTheme implements AppTheme {
  const LightTheme();

  @override
  ThemeData get theme => ThemeData(
    useMaterial3: true,
    fontFamily: AppFonts.base.fontFamily,
    textTheme: AppFonts.textTheme,
    appBarTheme: const AppBarTheme(titleTextStyle: AppFonts.h5, toolbarTextStyle: AppFonts.b2),
    splashColor: AppColors.bgdButtonPressedAD,
    highlightColor: AppColors.bgdButtonPressedAD,
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(overlayColor: _buttonPressedOverlayColor),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(overlayColor: _buttonPressedOverlayColor),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(overlayColor: _buttonPressedOverlayColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(overlayColor: _buttonPressedOverlayColor),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(overlayColor: _buttonPressedOverlayColor),
    ),
  );

  @override
  AppColorsTheme get colors => const LightColorTheme();
}

class DarkTheme extends LightTheme {
  const DarkTheme();
}
