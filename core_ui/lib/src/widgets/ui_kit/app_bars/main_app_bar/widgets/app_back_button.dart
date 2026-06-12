import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class AppBackButton extends StatelessWidget implements PreferredSizeWidget {
  const AppBackButton({super.key});

  static const double height = 50;

  @override
  Size get preferredSize => const Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final AppLocalization localization = context.localization;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.defaultHorizontalPadding,
        right: AppDimens.defaultHorizontalPadding,
        bottom: AppDimens.defaultHorizontalPadding,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: Navigator.of(context).maybePop,
            child: Ink(
              height: 36,
              padding: const EdgeInsets.fromLTRB(7, 7, 16, 7),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: colors.borders.main)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 8,
                children: <Widget>[
                  AppIcons.appBarChevronLeft.call(size: 24, color: colors.appBar.icon),
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
}
