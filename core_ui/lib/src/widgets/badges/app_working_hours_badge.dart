import 'package:core_ui/core_ui.dart';

class AppWorkingHoursBadge extends StatelessWidget {
  const AppWorkingHoursBadge({super.key, required this.workingHoursText});

  final String workingHoursText;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      padding: const EdgeInsets.fromLTRB(8, 4, 10, 4),
      decoration: BoxDecoration(
        color: colors.background.secondaryCard,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 6,
        children: <Widget>[
          AppIcons.clock(color: colors.icons.main),
          Text(workingHoursText, style: AppFonts.b2.copyWith(color: colors.text.main)),
        ],
      ),
    );
  }
}
