import 'package:intl/intl.dart';
import 'package:money2/money2.dart';

/// Formats monetary amounts with currency symbols from the money2 package.
class MoneyTextFormatter {
  MoneyTextFormatter._();

  static const Set<String> _trailingSymbolCurrencyCodes = <String>{
    'BYN',
    'KZT',
    'PLN',
    'RUB',
    'UAH',
  };

  static String format({
    required num amount,
    required String currencyCode,
    String? locale,
    int? decimalDigits,
  }) {
    final _CurrencyFormatSettings settings = _resolveSettings(currencyCode);
    final String resolvedLocale = locale ?? settings.locale;

    if (currencyCode.toUpperCase() == 'PTS') {
      return NumberFormat('#,##0', resolvedLocale).format(amount);
    }

    final NumberFormat formatter = NumberFormat.currency(
      decimalDigits: decimalDigits ?? settings.decimalDigits,
      name: '',
      locale: resolvedLocale,
    );

    final String formatted = formatter.format(amount).trim();
    final String symbol = settings.symbol;

    return settings.symbolFirst ? '$symbol$formatted' : '$formatted$symbol';
  }

  static _CurrencyFormatSettings _resolveSettings(String currencyCode) {
    assert(currencyCode.isNotEmpty, 'Currency code cannot be empty');
    final String normalizedCode = currencyCode.toUpperCase();

    if (normalizedCode == 'PTS') {
      return const _CurrencyFormatSettings(symbol: '', decimalDigits: 0, locale: 'ru_RU');
    }

    final Currency? currency = Currencies().find(normalizedCode);
    if (currency != null) {
      final String symbol = currency.symbol.trim();
      return _CurrencyFormatSettings(
        symbol: symbol.isNotEmpty ? symbol : normalizedCode,
        decimalDigits: currency.decimalDigits,
        locale: _localeForSeparators(
          thousandsSeparator: currency.groupSeparator,
          decimalMark: currency.decimalSeparator,
        ),
        symbolFirst: _resolveSymbolFirst(currency, normalizedCode),
      );
    }

    return _CurrencyFormatSettings(symbol: normalizedCode, decimalDigits: 2, locale: 'ru_RU');
  }

  static bool _resolveSymbolFirst(Currency currency, String normalizedCode) {
    if (_trailingSymbolCurrencyCodes.contains(normalizedCode)) return false;
    return _isSymbolFirstFromPattern(currency.pattern);
  }

  static bool _isSymbolFirstFromPattern(String pattern) {
    final String positiveSection = pattern.split(';').first;
    final int symbolIndex = positiveSection.indexOf('S');
    if (symbolIndex < 0) return true;

    final int digitIndex = positiveSection.indexOf(RegExp('[#0]'));
    if (digitIndex < 0) return true;

    return symbolIndex < digitIndex;
  }

  static String _localeForSeparators({
    required String thousandsSeparator,
    required String decimalMark,
  }) {
    if (thousandsSeparator == ',' && decimalMark == '.') return 'en_US';
    if (thousandsSeparator == '.' && decimalMark == ',') return 'ru_RU';
    if (thousandsSeparator == ' ' && decimalMark == ',') return 'fr_FR';
    if (thousandsSeparator == "'" && decimalMark == '.') return 'de_CH';
    return 'en_US';
  }
}

final class _CurrencyFormatSettings {
  const _CurrencyFormatSettings({
    required this.symbol,
    required this.decimalDigits,
    required this.locale,
    this.symbolFirst = false,
  });

  final String symbol;
  final int decimalDigits;
  final String locale;
  final bool symbolFirst;
}
