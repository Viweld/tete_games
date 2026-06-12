import 'package:flutter/foundation.dart';

/// In-memory source of the current currency code for guest API requests.
class CurrencyController extends ChangeNotifier {
  CurrencyController({required String initialCurrencyCode})
    : _currencyCode = _normalize(initialCurrencyCode);

  static const String defaultCurrencyCode = 'USD';

  String _currencyCode;

  String get currencyCode => _currencyCode;

  void setCurrencyCode(String currencyCode) {
    final String normalized = _normalize(currencyCode);
    if (_currencyCode == normalized) return;

    _currencyCode = normalized;
    notifyListeners();
  }

  static String _normalize(String currencyCode) {
    final String trimmed = currencyCode.trim().toUpperCase();
    return trimmed.isEmpty ? defaultCurrencyCode : trimmed;
  }
}
