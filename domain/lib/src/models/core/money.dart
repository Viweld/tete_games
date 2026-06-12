part of 'core_models.dart';

/// A class representing a monetary value with amount and currency.
@immutable
class Money {
  /// The monetary amount.
  final double amount;

  /// The currency code (e.g., USD, EUR).
  final String currency;

  const Money({required this.amount, required this.currency});
}
