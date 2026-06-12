import 'dart:ui';

Color? parseHexColor(String? hex) {
  if (hex == null || hex.isEmpty) return null;
  final String digits = hex.startsWith('#') ? hex.substring(1) : hex;
  final int? value = int.tryParse(digits, radix: 16);
  return value != null ? Color(0xFF000000 | value) : null;
}

double? parseRatingString(String? value) {
  if (value == null || value.isEmpty) return null;
  return double.tryParse(value);
}
