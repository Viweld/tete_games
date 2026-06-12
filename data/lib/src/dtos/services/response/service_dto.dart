part of '../services_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class ServiceDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'airport_name')
  final String? airportName;

  @JsonKey(name: 'marketing_name')
  final String? marketingName;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'terminal_id')
  final int? terminalId;

  @JsonKey(name: 'terminal_name')
  final String? terminalName;

  @JsonKey(name: 'category')
  final SimpleCategoryDto? category;

  @JsonKey(name: 'airport')
  final SimpleAirportDto? airport;

  @JsonKey(name: 'terminals')
  final List<TerminalDto>? terminals;

  @JsonKey(name: 'images')
  @ServiceImagesConverter()
  final List<PhotoDto>? images;

  @JsonKey(name: 'photo')
  final PhotoDto? photo;

  @JsonKey(name: 'displayPrice')
  final MoneyDto? displayPrice;

  @JsonKey(name: 'prices')
  final List<ServicePriceDto>? prices;

  @JsonKey(name: 'price_text')
  final String? priceText;

  @JsonKey(name: 'is_price_on_request')
  final bool? isPriceOnRequest;

  @JsonKey(name: 'ordering')
  final int? ordering;

  @JsonKey(name: 'is_popular')
  final bool? isPopular;

  @JsonKey(name: 'popularity_score')
  final int? popularityScore;

  const ServiceDto({
    required this.id,
    this.airportName,
    this.marketingName,
    this.description,
    this.terminalId,
    this.terminalName,
    this.category,
    this.airport,
    this.terminals,
    this.images,
    this.photo,
    this.displayPrice,
    this.prices,
    this.priceText,
    this.isPriceOnRequest,
    this.ordering,
    this.isPopular,
    this.popularityScore,
  });

  factory ServiceDto.fromJson(Map<String, dynamic> json) => _$ServiceDtoFromJson(json);
}
