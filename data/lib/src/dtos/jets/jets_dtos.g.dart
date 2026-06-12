// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jets_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateJetAirportDto _$PrivateJetAirportDtoFromJson(
  Map<String, dynamic> json,
) => PrivateJetAirportDto(
  id: (json['id'] as num).toInt(),
  iataCode: json['iata_code'] as String?,
  name: json['name'] as String?,
  slug: json['slug'] as String?,
);

PrivateJetCategoryDto _$PrivateJetCategoryDtoFromJson(
  Map<String, dynamic> json,
) => PrivateJetCategoryDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  description: json['description'] as String?,
  seoTitle: json['seo_title'] as String?,
  seoDescription: json['seo_description'] as String?,
  workingHoursText: json['working_hours_text'] as String?,
  tag: json['tag'] == null
      ? null
      : MarketingTagDto.fromJson(json['tag'] as Map<String, dynamic>),
  urlPath: json['url_path'] as String?,
);

PrivateJetDto _$PrivateJetDtoFromJson(Map<String, dynamic> json) =>
    PrivateJetDto(
      id: (json['id'] as num).toInt(),
      marketingName: json['marketing_name'] as String?,
      airport: json['airport'] == null
          ? null
          : PrivateJetAirportDto.fromJson(
              json['airport'] as Map<String, dynamic>,
            ),
      modelType: json['model_type'] as String?,
      passengersCapacity: (json['passengers_capacity'] as num?)?.toInt(),
      rangeKm: (json['range_km'] as num?)?.toInt(),
      speedKmh: (json['speed_kmh'] as num?)?.toInt(),
      baggageKg: (json['baggage_kg'] as num?)?.toInt(),
      cabinSize: json['cabin_size'] as String?,
      startingFrom: json['starting_from'] == null
          ? null
          : MoneyDto.fromJson(json['starting_from'] as Map<String, dynamic>),
      photo: json['photo'] == null
          ? null
          : PhotoDto.fromJson(json['photo'] as Map<String, dynamic>),
      guides: (json['guides'] as List<dynamic>?)
          ?.map((e) => ServiceGuideDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PrivateJetsCatalogDto _$PrivateJetsCatalogDtoFromJson(
  Map<String, dynamic> json,
) => PrivateJetsCatalogDto(
  category: json['category'] == null
      ? null
      : PrivateJetCategoryDto.fromJson(
          json['category'] as Map<String, dynamic>,
        ),
  guides: (json['guides'] as List<dynamic>?)
      ?.map((e) => ServiceGuideDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  jets: (json['jets'] as List<dynamic>?)
      ?.map((e) => PrivateJetDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  pagination: json['pagination'] == null
      ? null
      : PrivateJetsPaginationDto.fromJson(
          json['pagination'] as Map<String, dynamic>,
        ),
);

PrivateJetsPaginationDto _$PrivateJetsPaginationDtoFromJson(
  Map<String, dynamic> json,
) => PrivateJetsPaginationDto(
  count: (json['count'] as num?)?.toInt(),
  next: json['next'] as String?,
  previous: json['previous'] as String?,
  page: (json['page'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  totalPages: (json['total_pages'] as num?)?.toInt(),
);
