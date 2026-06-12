part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class UpdateOrderEndpointServicesDto {
  @JsonKey(name: 'iata_code')
  final String iataCode;

  @JsonKey(name: 'terminal_id')
  final int? terminalId;

  @JsonKey(name: 'terminal_name')
  final String terminalName;

  @JsonKey(name: 'endpoint_type')
  final String endpointType;

  @JsonKey(name: 'service_ids')
  final List<int> serviceIds;

  const UpdateOrderEndpointServicesDto({
    required this.iataCode,
    this.terminalId,
    required this.terminalName,
    required this.endpointType,
    required this.serviceIds,
  });

  Map<String, dynamic> toJson() => _$UpdateOrderEndpointServicesDtoToJson(this);
}
