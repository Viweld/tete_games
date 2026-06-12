part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderSummaryDto {
  @JsonKey(name: 'flight_info')
  final Map<String, dynamic>? flightInfo;

  @JsonKey(name: 'services_breakdown')
  final List<SummaryItemDto>? servicesBreakdown;

  @JsonKey(name: 'total_amount')
  final Object? totalAmount;

  @JsonKey(name: 'currency')
  final String? currency;

  const OrderSummaryDto({this.flightInfo, this.servicesBreakdown, this.totalAmount, this.currency});

  factory OrderSummaryDto.fromJson(Map<String, dynamic> json) => _$OrderSummaryDtoFromJson(json);
}
