part of 'ordering_read_models.dart';

@immutable
class OrderEndpointServices {
  final String iataCode;
  final int terminalId;
  final String terminalName;
  final EndpointType endpointType;
  final List<int> serviceIds;

  const OrderEndpointServices({
    required this.iataCode,
    required this.terminalId,
    required this.terminalName,
    required this.endpointType,
    required this.serviceIds,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEndpointServices &&
          runtimeType == other.runtimeType &&
          iataCode == other.iataCode &&
          terminalId == other.terminalId &&
          endpointType == other.endpointType;

  @override
  int get hashCode => Object.hash(iataCode, terminalId, endpointType);
}
