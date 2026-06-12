part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderTransferDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'time')
  final String? time;

  @JsonKey(name: 'pickup_address')
  final String? pickupAddress;

  @JsonKey(name: 'dropoff_address')
  final String? dropoffAddress;

  @JsonKey(name: 'flight_number')
  final String? flightNumber;

  @JsonKey(name: 'service_id')
  final int? serviceId;

  @JsonKey(name: 'service_name')
  final String? serviceName;

  @JsonKey(name: 'category')
  final SimpleCategoryDto? category;

  @JsonKey(name: 'airport')
  final SimpleAirportDto? airport;

  @JsonKey(name: 'terminal')
  final TerminalDto? terminal;

  @JsonKey(name: 'is_paid')
  final bool? isPaid;

  @JsonKey(name: 'payment_amount')
  final Object? paymentAmount;

  @JsonKey(name: 'payment_currency')
  final String? paymentCurrency;

  @JsonKey(name: 'stops_list')
  final List<OrderTransferStopDto>? stopsList;

  const OrderTransferDto({
    required this.id,
    this.date,
    this.time,
    this.pickupAddress,
    this.dropoffAddress,
    this.flightNumber,
    this.serviceId,
    this.serviceName,
    this.category,
    this.airport,
    this.terminal,
    this.isPaid,
    this.paymentAmount,
    this.paymentCurrency,
    this.stopsList,
  });

  factory OrderTransferDto.fromJson(Map<String, dynamic> json) => _$OrderTransferDtoFromJson(json);
}
