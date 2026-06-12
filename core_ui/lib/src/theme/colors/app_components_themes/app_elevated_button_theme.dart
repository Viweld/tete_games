import 'package:core_ui/core_ui.dart';

final class AppElevatedButtonTheme {
  final AppElevatedButtonBackgroundTheme backgroundDefault;
  final AppElevatedButtonBackgroundTheme backgroundActive;
  final AppElevatedButtonBackgroundTheme backgroundDisabled;
  final AppElevatedButtonContentTheme contentDefault;
  final AppElevatedButtonContentTheme contentDisabled;

  const AppElevatedButtonTheme({
    required this.backgroundDefault,
    required this.backgroundActive,
    required this.backgroundDisabled,
    required this.contentDefault,
    required this.contentDisabled,
  });
}

final class AppElevatedButtonBackgroundTheme {
  final Color main;
  final Color red;
  final Color accent;

  const AppElevatedButtonBackgroundTheme({
    required this.main,
    required this.red,
    required this.accent,
  });
}

final class AppElevatedButtonContentTheme {
  final Color main;

  const AppElevatedButtonContentTheme({required this.main});
}
