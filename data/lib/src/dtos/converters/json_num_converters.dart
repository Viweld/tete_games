/// Parses API values that may be encoded as [num] or decimal [String].
abstract final class JsonNumConverters {
  static double doubleFromJson(Object? value) {
    if (value == null) {
      return 0;
    }
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value) ?? 0;
    }
    return 0;
  }

  static int intFromJson(Object? value) {
    if (value == null) {
      return 0;
    }
    if (value is int) {
      return value;
    }
    if (value is num) {
      return value.toInt();
    }
    if (value is String) {
      return int.tryParse(value) ?? double.tryParse(value)?.toInt() ?? 0;
    }
    return 0;
  }

  static String stringFromJson(Object? value, {String fallback = '0'}) {
    if (value == null) {
      return fallback;
    }
    if (value is String) {
      return value;
    }
    if (value is num) {
      return value.toString();
    }
    return fallback;
  }
}
