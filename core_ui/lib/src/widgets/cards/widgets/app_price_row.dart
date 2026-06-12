import 'package:core_ui/core_ui.dart';

class AppPriceRow extends StatelessWidget {
  final String label;
  final double price;
  final String currency;
  final String? prefix;
  final String? suffix;
  final String? isFreeText;

  const AppPriceRow({
    required this.label,
    required this.price,
    required this.currency,
    this.prefix,
    this.suffix,
    this.isFreeText,
  });

  @override
  Widget build(BuildContext context) {
    final AppColorsTheme colors = context.colors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: <Widget>[
        Text(label, style: AppFonts.b4.copyWith(color: colors.text.main)),
        if (price == 0 && isFreeText != null)
          Row(
            children: <Widget>[
              Text(' • ', style: AppFonts.b2.copyWith(color: colors.text.main)),
              Expanded(
                child: Text(isFreeText!, style: AppFonts.b2.copyWith(color: colors.text.main)),
              ),
            ],
          )
        else
          Row(
            children: <Widget>[
              Text(' • ', style: AppFonts.b2.copyWith(color: colors.text.main)),
              if ((prefix ?? '').isNotEmpty)
                Text(prefix!, style: AppFonts.b2.copyWith(color: colors.text.main)),
              MoneyText(
                amount: price,
                currencyCode: currency,
                style: AppFonts.b2.copyWith(color: colors.text.main),
              ),
              if ((suffix ?? '').isNotEmpty)
                Text(suffix ?? '', style: AppFonts.b2.copyWith(color: colors.text.main)),
            ],
          ),
      ],
    );
  }
}
