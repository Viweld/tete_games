part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderItemDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'service_id')
  final int? serviceId;

  @JsonKey(name: 'serviceName')
  final String? serviceName;

  @JsonKey(name: 'category')
  final SimpleCategoryDto? category;

  @JsonKey(name: 'airport')
  final SimpleAirportDto? airport;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'airport_photo')
  final PhotoDto? airportPhoto;

  @JsonKey(name: 'terminal')
  final TerminalDto? terminal;

  @JsonKey(name: 'adults_count')
  final int? adultsCount;

  @JsonKey(name: 'children_count')
  final int? childrenCount;

  @JsonKey(name: 'infants_count')
  final int? infantsCount;

  @JsonKey(name: 'prices')
  final List<OrderItemPriceDto>? prices;

  @JsonKey(name: 'total_price')
  final Object? totalPrice;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'currency_symbol')
  final String? currencySymbol;

  const OrderItemDto({
    required this.id,
    this.serviceId,
    this.serviceName,
    this.category,
    this.airport,
    this.country,
    this.airportPhoto,
    this.terminal,
    this.adultsCount,
    this.childrenCount,
    this.infantsCount,
    this.prices,
    this.totalPrice,
    this.currency,
    this.currencySymbol,
  });

  factory OrderItemDto.fromJson(Map<String, dynamic> json) => _$OrderItemDtoFromJson(json);
}
