part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderItemPriceDto {
  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'adult_price')
  final num? adultPrice;

  @JsonKey(name: 'child_price')
  final num? childPrice;

  @JsonKey(name: 'infant_price')
  final num? infantPrice;

  @JsonKey(name: 'is_manual')
  final bool? isManual;

  const OrderItemPriceDto({
    this.currency,
    this.adultPrice,
    this.childPrice,
    this.infantPrice,
    this.isManual,
  });

  factory OrderItemPriceDto.fromJson(Map<String, dynamic> json) =>
      _$OrderItemPriceDtoFromJson(json);
}
