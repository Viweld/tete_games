part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class SummaryItemDto {
  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'price_per_unit')
  final Object? pricePerUnit;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'count')
  final int? count;

  @JsonKey(name: 'total')
  final Object? total;

  @JsonKey(name: 'note')
  final String? note;

  @JsonKey(name: 'endpoint_type')
  final String? endpointType;

  @JsonKey(name: 'iata_code')
  final String? iataCode;

  @JsonKey(name: 'terminal_name')
  final String? terminalName;

  @JsonKey(name: 'passengers_count')
  final int? passengersCount;

  @JsonKey(name: 'service_id')
  final int? serviceId;

  @JsonKey(name: 'pickup_address')
  final String? pickupAddress;

  @JsonKey(name: 'dropoff_address')
  final String? dropoffAddress;

  @JsonKey(name: 'transfer_id')
  final int? transferId;

  @JsonKey(name: 'stops_list')
  final List<OrderTransferStopDto>? stopsList;

  const SummaryItemDto({
    this.name,
    this.pricePerUnit,
    this.currency,
    this.count,
    this.total,
    this.note,
    this.endpointType,
    this.iataCode,
    this.terminalName,
    this.passengersCount,
    this.serviceId,
    this.pickupAddress,
    this.dropoffAddress,
    this.transferId,
    this.stopsList,
  });

  factory SummaryItemDto.fromJson(Map<String, dynamic> json) => _$SummaryItemDtoFromJson(json);
}
