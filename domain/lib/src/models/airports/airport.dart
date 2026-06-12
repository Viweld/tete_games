import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
class Airport {
  final int id;
  final String iataCode;
  final String name;
  final String? cityName;
  final String? countryName;
  final String? countryCode;
  final Currency? currency;
  final CountryFlag? countryFlag;
  final Photo? photo;
  final bool isPopular;
  final int popularityScore;
  final List<AirportServiceTag> tags;

  const Airport({
    required this.id,
    required this.name,
    required this.iataCode,
    this.cityName,
    this.countryName,
    this.countryCode,
    this.currency,
    this.countryFlag,
    this.photo,
    this.isPopular = false,
    this.popularityScore = 0,
    this.tags = const <AirportServiceTag>[],
  });
}
