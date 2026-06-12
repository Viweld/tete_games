part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class UpdateOrderTransferDto {
  @JsonKey(name: 'service_id')
  final int? serviceId;

  @JsonKey(name: 'flight_number')
  final String? flightNumber;

  @JsonKey(name: 'date')
  final String? date;

  @JsonKey(name: 'time')
  final String? time;

  @JsonKey(name: 'pickup_address')
  final String? pickupAddress;

  @JsonKey(name: 'dropoff_address')
  final String? dropoffAddress;

  @JsonKey(name: 'stops')
  final List<String>? stops;

  const UpdateOrderTransferDto({
    this.serviceId,
    this.flightNumber,
    this.date,
    this.time,
    this.pickupAddress,
    this.dropoffAddress,
    this.stops,
  });

  Map<String, dynamic> toJson() => _$UpdateOrderTransferDtoToJson(this);
}
