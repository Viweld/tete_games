import 'package:flutter/services.dart';

class MaxValueTextInputFormatter extends TextInputFormatter {
  final double maxValue;

  MaxValueTextInputFormatter(this.maxValue);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final double? value = double.tryParse(newValue.text);
    if (value == null) {
      return oldValue;
    }

    if (value > maxValue) {
      final String text = maxValue.toStringAsFixed(0);
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }

    return newValue;
  }
}
