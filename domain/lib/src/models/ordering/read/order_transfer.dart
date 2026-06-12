part of 'ordering_read_models.dart';

@immutable
class OrderTransfer {
  final int id;
  final String? date;
  final String? time;
  final String? pickupAddress;
  final String? dropoffAddress;
  final String? flightNumber;
  final int? serviceId;
  final String? serviceName;
  final SimpleCategory? category;
  final SimpleAirport? airport;
  final Terminal? terminal;
  final bool isPaid;
  final double? paymentAmount;
  final String? paymentCurrency;
  final List<OrderTransferStop> stopsList;

  const OrderTransfer({
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
    this.isPaid = false,
    this.paymentAmount,
    this.paymentCurrency,
    this.stopsList = const <OrderTransferStop>[],
  });
}
