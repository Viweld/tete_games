part of 'ordering_write_models.dart';

@immutable
class UpdateOrderEndpointServices {
  final String iataCode;
  final int terminalId;
  final String terminalName;
  final EndpointType endpointType;
  final List<int> serviceIds;

  const UpdateOrderEndpointServices({
    required this.iataCode,
    required this.terminalId,
    required this.terminalName,
    required this.endpointType,
    required this.serviceIds,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateOrderEndpointServices &&
          runtimeType == other.runtimeType &&
          iataCode == other.iataCode &&
          terminalId == other.terminalId &&
          endpointType == other.endpointType;

  @override
  int get hashCode => Object.hash(iataCode, terminalId, endpointType);
}
