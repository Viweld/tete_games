part of 'ordering_read_models.dart';

@immutable
class OrderSummary {
  final double totalAmount;
  final String currency;
  final List<EndpointSummary> endpoints;

  const OrderSummary({required this.totalAmount, required this.currency, required this.endpoints});
}
