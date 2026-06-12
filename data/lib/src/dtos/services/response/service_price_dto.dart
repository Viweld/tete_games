part of '../services_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class ServicePriceDto {
  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'adult_price')
  final Object? adultPrice;

  @JsonKey(name: 'child_price')
  final Object? childPrice;

  @JsonKey(name: 'infant_price')
  final Object? infantPrice;

  const ServicePriceDto({this.currency, this.adultPrice, this.childPrice, this.infantPrice});

  factory ServicePriceDto.fromJson(Map<String, dynamic> json) => _$ServicePriceDtoFromJson(json);
}
