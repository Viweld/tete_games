import 'package:core_ui/core_ui.dart';

final class AppNavBarTheme {
  final Color background;
  final Color border;
  final Color activeItem;
  final Color defaultItem;
  final List<BoxShadow> navBarShadows;
  final LinearGradient backgroundGradient;

  const AppNavBarTheme({
    required this.background,
    required this.border,
    required this.activeItem,
    required this.defaultItem,
    required this.navBarShadows,
    required this.backgroundGradient,
  });
}
