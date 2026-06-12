// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airports_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirportDetailDto _$AirportDetailDtoFromJson(Map<String, dynamic> json) =>
    AirportDetailDto(
      iataCode: json['iataCode'] as String,
      name: json['name'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      description: json['description'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      terminals: (json['terminals'] as List<dynamic>?)
          ?.map((e) => TerminalDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceGroups: (json['serviceGroups'] as List<dynamic>?)
          ?.map((e) => ServiceGroupDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      slug: json['slug'] as String?,
      importantInfo: json['importantInfo'] == null
          ? null
          : AirportImportantInfoDto.fromJson(
              json['importantInfo'] as Map<String, dynamic>,
            ),
      airportRenderData: (json['airportRenderData'] as List<dynamic>?)
          ?.map((e) => AirportRenderDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => LocationReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      isPublished: json['isPublished'] as bool?,
      popularityScore: (json['popularityScore'] as num?)?.toInt(),
    );

AirportRenderDataDto _$AirportRenderDataDtoFromJson(
  Map<String, dynamic> json,
) => AirportRenderDataDto(
  key: json['key'] as String?,
  value: json['value'] as String?,
);

AirportImportantInfoDto _$AirportImportantInfoDtoFromJson(
  Map<String, dynamic> json,
) => AirportImportantInfoDto(
  rating: json['rating'] as String?,
  reviewsCount: (json['reviews_count'] as num?)?.toInt(),
  workingHoursText: json['working_hours_text'] as String?,
  airlines: json['airlines'] as String?,
  annualPassengers: json['annual_passengers'] as String?,
  freeCancellation: json['free_cancellation'] as String?,
  gatesCount: json['gates_count'] as String?,
  address: json['address'] as String?,
  distanceToCityCenter: json['distance_to_city_center'] as String?,
  publicTransport: json['public_transport'] as String?,
);

AirportDto _$AirportDtoFromJson(Map<String, dynamic> json) => AirportDto(
  id: (json['id'] as num).toInt(),
  iataCode: json['iata_code'] as String,
  name: json['name'] as String?,
  cityName: json['cityName'] as String?,
  countryName: json['countryName'] as String?,
  countryCode: json['countryCode'] as String?,
  isPopular: json['is_popular'] as bool?,
  popularityScore: (json['popularity_score'] as num?)?.toInt(),
  currency: json['currency'] == null
      ? null
      : CurrencyDto.fromJson(json['currency'] as Map<String, dynamic>),
  countryFlag: json['countryFlag'] == null
      ? null
      : CountryFlagDto.fromJson(json['countryFlag'] as Map<String, dynamic>),
  photo: json['photo'] == null
      ? null
      : PhotoDto.fromJson(json['photo'] as Map<String, dynamic>),
  tags: (json['tags'] as List<dynamic>?)
      ?.map((e) => AirportTagDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

AirportTagDto _$AirportTagDtoFromJson(Map<String, dynamic> json) =>
    AirportTagDto(
      label: json['label'] as String?,
      backgroundColor: json['backgroundColor'] as String?,
      color: json['color'] as String?,
    );

TerminalDto _$TerminalDtoFromJson(Map<String, dynamic> json) => TerminalDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  ordering: (json['ordering'] as num?)?.toInt(),
);
