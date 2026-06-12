import 'package:navigation/navigation.dart';

class AppBellNotAuthenticated extends StatelessWidget {
  const AppBellNotAuthenticated({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    return SizedBox.square(
      dimension: 40,
      child: Center(
        child: AppIcons.appBarBell.call(size: 24, color: colors.appBar.icon, onTap: () {}),
      ),
    );
  }
}
