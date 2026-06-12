import 'package:core_ui/src/widgets/ui_kit/texts/money_text/money_text_formatter.dart';
import 'package:flutter/widgets.dart';

class MoneyText extends StatelessWidget {
  final num amount;
  final String currencyCode;
  final TextStyle? style;
  final String? locale;
  final int? decimalDigits;

  const MoneyText({
    super.key,
    required this.amount,
    required this.currencyCode,
    this.style,
    this.locale,
    this.decimalDigits,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      MoneyTextFormatter.format(
        amount: amount,
        currencyCode: currencyCode,
        locale: locale,
        decimalDigits: decimalDigits,
      ),
      style: style,
    );
  }
}
