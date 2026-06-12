import 'package:core_ui/core_ui.dart';

class AppSwith extends StatelessWidget {
  const AppSwith({super.key, required this.isEnabled, required this.onChanged});

  final bool isEnabled;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Switch.adaptive(
      value: isEnabled,
      onChanged: onChanged,
      activeTrackColor: colors.selection.fillSelected,
      inactiveThumbColor: colors.selection.fillSelected,
      trackOutlineColor: WidgetStateProperty.all(colors.selection.fillSelected),
      trackColor: isEnabled ? null : WidgetStateProperty.all(Colors.transparent),
    );
  }
}
