import 'package:core_ui/core_ui.dart';

/// Tariff row: label + value with a bullet marker.
///
/// [value] is passed as a pre-formatted string, not as a monetary amount.
class TariffPriceRow extends StatelessWidget {
  final String label;
  final String value;

  const TariffPriceRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 4,
      children: <Widget>[
        Text(label, style: AppFonts.b4.copyWith(color: colors.text.main)),
        Row(
          spacing: 8,
          children: <Widget>[
            const SizedBox(),
            Text('•', style: AppFonts.b2.copyWith(color: colors.text.main)),
            Text(value, style: AppFonts.b2.copyWith(color: colors.text.main)),
          ],
        ),
      ],
    );
  }
}
