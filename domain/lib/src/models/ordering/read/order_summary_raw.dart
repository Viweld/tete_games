part of 'ordering_read_models.dart';

@immutable
class OrderSummaryRaw {
  final double totalAmount;
  final String currency;
  final List<SummaryItem> servicesBreakdown;

  const OrderSummaryRaw({
    required this.totalAmount,
    required this.currency,
    this.servicesBreakdown = const <SummaryItem>[],
  });
}
