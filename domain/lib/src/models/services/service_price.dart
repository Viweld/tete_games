part of 'services_models.dart';

/// A class representing service pricing information for different passenger types.
@immutable
class ServicePrice {
  /// The currency code for the pricing (e.g., USD, EUR).
  final String currency;

  /// The price for adult passengers.
  final double adultPrice;

  /// The price for child passengers.
  final double childPrice;

  /// The price for infant passengers.
  final double infantPrice;

  /// The total price for all passenger types.
  double get total => min(min(adultPrice, childPrice), infantPrice);

  const ServicePrice({
    required this.currency,
    required this.adultPrice,
    required this.childPrice,
    required this.infantPrice,
  });
}
