// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceDto _$ServiceDtoFromJson(Map<String, dynamic> json) => ServiceDto(
  id: (json['id'] as num).toInt(),
  airportName: json['airport_name'] as String?,
  marketingName: json['marketing_name'] as String?,
  description: json['description'] as String?,
  terminalId: (json['terminal_id'] as num?)?.toInt(),
  terminalName: json['terminal_name'] as String?,
  category: json['category'] == null
      ? null
      : SimpleCategoryDto.fromJson(json['category'] as Map<String, dynamic>),
  airport: json['airport'] == null
      ? null
      : SimpleAirportDto.fromJson(json['airport'] as Map<String, dynamic>),
  terminals: (json['terminals'] as List<dynamic>?)
      ?.map((e) => TerminalDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  images: const ServiceImagesConverter().fromJson(json['images']),
  photo: json['photo'] == null
      ? null
      : PhotoDto.fromJson(json['photo'] as Map<String, dynamic>),
  displayPrice: json['displayPrice'] == null
      ? null
      : MoneyDto.fromJson(json['displayPrice'] as Map<String, dynamic>),
  prices: (json['prices'] as List<dynamic>?)
      ?.map((e) => ServicePriceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  priceText: json['price_text'] as String?,
  isPriceOnRequest: json['is_price_on_request'] as bool?,
  ordering: (json['ordering'] as num?)?.toInt(),
  isPopular: json['is_popular'] as bool?,
  popularityScore: (json['popularity_score'] as num?)?.toInt(),
);

ServicePriceDto _$ServicePriceDtoFromJson(Map<String, dynamic> json) =>
    ServicePriceDto(
      currency: json['currency'] as String?,
      adultPrice: json['adult_price'],
      childPrice: json['child_price'],
      infantPrice: json['infant_price'],
    );

SimpleAirportDto _$SimpleAirportDtoFromJson(Map<String, dynamic> json) =>
    SimpleAirportDto(
      id: (json['id'] as num).toInt(),
      iataCode: json['iata_code'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$SimpleAirportDtoToJson(SimpleAirportDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'iata_code': instance.iataCode,
      'name': instance.name,
    };

SimpleCategoryDto _$SimpleCategoryDtoFromJson(Map<String, dynamic> json) =>
    SimpleCategoryDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] == null
          ? null
          : PhotoDto.fromJson(json['image'] as Map<String, dynamic>),
    );
