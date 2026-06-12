import 'package:flutter/services.dart';

class NoLeadingZerosTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Prevent leading zero if followed by another digit
    if (newValue.text.startsWith('0') && newValue.text.length > 1) {
      return TextEditingValue(
        text: newValue.text.substring(1),
        selection: TextSelection.collapsed(offset: newValue.selection.end - 1),
      );
    }

    // Prevent consecutive zeros if the whole string is just zeros
    if (newValue.text == '00') {
      return oldValue;
    }

    return newValue;
  }
}
