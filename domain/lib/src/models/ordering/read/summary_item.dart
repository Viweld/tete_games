part of 'ordering_read_models.dart';

@immutable
class SummaryItem {
  final String name;
  final num pricePerUnit;
  final String currency;
  final int count;
  final num total;
  final String? note;
  final EndpointType? endpointType;
  final String? iataCode;
  final String? terminalName;
  final int? passengersCount;
  final int? serviceId;
  final String? pickupAddress;
  final String? dropoffAddress;
  final int? transferId;
  final List<OrderTransferStop> stopsList;

  const SummaryItem({
    required this.name,
    required this.pricePerUnit,
    required this.currency,
    required this.count,
    required this.total,
    this.note,
    this.endpointType,
    this.iataCode,
    this.terminalName,
    this.passengersCount,
    this.serviceId,
    this.pickupAddress,
    this.dropoffAddress,
    this.transferId,
    this.stopsList = const <OrderTransferStop>[],
  });
}
