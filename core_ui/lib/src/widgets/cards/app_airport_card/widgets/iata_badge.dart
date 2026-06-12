import 'package:core_ui/core_ui.dart';

class IataBadge extends StatelessWidget {
  final String iataCode;

  const IataBadge({super.key, required this.iataCode});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: colors.background.accentOrange,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Text(iataCode, style: AppFonts.b4.copyWith(color: colors.text.white)),
    );
  }
}
