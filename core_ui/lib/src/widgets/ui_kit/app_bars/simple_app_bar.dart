part of 'app_bars.dart';

class SimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SimpleAppBar();

  static const double height = 64;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final AppLocalization localization = context.localization;

    final double fullHeight = height + MediaQuery.of(context).padding.top;

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      toolbarHeight: fullHeight,
      titleSpacing: 0,
      leadingWidth: 0,
      centerTitle: false,
      backgroundColor: colors.appBar.background,
      surfaceTintColor: colors.appBar.background,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: Navigator.of(context).maybePop,
            child: Ink(
              height: 36,
              padding: const EdgeInsets.fromLTRB(7, 7, 16, 7),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: <Widget>[
                  Icon(Icons.arrow_back_ios_new_rounded, size: 24, color: colors.appBar.icon),
                  Text(
                    localization.core_back_button,
                    style: AppFonts.button.copyWith(color: colors.appBar.text),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(height);
}
