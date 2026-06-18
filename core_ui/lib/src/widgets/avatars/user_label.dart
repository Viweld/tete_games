import 'package:core_ui/core_ui.dart';

class UserLabel extends StatelessWidget {
  final String label;
  final bool isRemote;

  const UserLabel({required this.label, this.isRemote = false});

  static const double radius = 16;

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;
    final String initial = label.isNotEmpty ? label.characters.first.toUpperCase() : '?';

    return CircleAvatar(
      radius: radius,
      backgroundColor: isRemote ? colors.background.successGreen : colors.background.infoBlue,
      child: Text(initial, style: AppFonts.b4.copyWith(color: colors.text.white)),
    );
  }
}
