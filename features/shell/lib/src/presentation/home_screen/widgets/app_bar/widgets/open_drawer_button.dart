import 'package:core_ui/core_ui.dart';

class OpenDrawerButton extends StatelessWidget {
  const OpenDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(shape: BoxShape.circle, color: colors.background.accentOrange),
      child: AppIcons.more2.call(
        color: colors.icons.main,
        onTap: () => Scaffold.of(context).openEndDrawer(),
      ),
    );
  }
}
