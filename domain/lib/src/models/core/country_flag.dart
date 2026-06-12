part of 'core_models.dart';

/// A class representing a country flag with multiple size variants.
@immutable
class CountryFlag {
  /// URL to the original flag.
  final String original;

  /// URL to the large-sized flag.
  final String large;

  /// URL to the medium-sized flag.
  final String medium;

  /// URL to the small-sized flag.
  final String small;

  const CountryFlag({
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
  });
}
