part of '../airports_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class AirportDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'iata_code')
  final String iataCode;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'cityName')
  final String? cityName;

  @JsonKey(name: 'countryName')
  final String? countryName;

  @JsonKey(name: 'countryCode')
  final String? countryCode;

  @JsonKey(name: 'is_popular')
  final bool? isPopular;

  @JsonKey(name: 'popularity_score')
  final int? popularityScore;

  @JsonKey(name: 'currency')
  final CurrencyDto? currency;

  @JsonKey(name: 'countryFlag')
  final CountryFlagDto? countryFlag;

  @JsonKey(name: 'photo')
  final PhotoDto? photo;

  @JsonKey(name: 'tags')
  final List<AirportTagDto>? tags;

  const AirportDto({
    required this.id,
    required this.iataCode,
    this.name,
    this.cityName,
    this.countryName,
    this.countryCode,
    this.isPopular,
    this.popularityScore,
    this.currency,
    this.countryFlag,
    this.photo,
    this.tags,
  });

  factory AirportDto.fromJson(Map<String, dynamic> json) => _$AirportDtoFromJson(json);
}
