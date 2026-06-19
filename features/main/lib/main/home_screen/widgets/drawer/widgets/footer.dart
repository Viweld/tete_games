import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalization localization = context.localization;
    final AppColorsTheme colors = context.colors;
    final int year = DateTime.now().year;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            localization.peer_home_drawer_copyright(year),
            style: AppFonts.caption.copyWith(color: colors.text.secondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            localization.peer_home_drawer_version(AppConstants.appVersion),
            style: AppFonts.caption.copyWith(color: colors.text.secondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
