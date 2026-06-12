part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderEndpointServicesDto {
  @JsonKey(name: 'iata_code')
  final String iataCode;

  @JsonKey(name: 'terminal_id')
  final int terminalId;

  @JsonKey(name: 'terminal_name')
  final String terminalName;

  @JsonKey(name: 'endpoint_type')
  final String endpointType;

  @JsonKey(name: 'service_ids')
  final List<int> serviceIds;

  const OrderEndpointServicesDto({
    required this.iataCode,
    required this.terminalId,
    required this.terminalName,
    required this.endpointType,
    required this.serviceIds,
  });

  factory OrderEndpointServicesDto.fromJson(Map<String, dynamic> json) =>
      _$OrderEndpointServicesDtoFromJson(json);
}
