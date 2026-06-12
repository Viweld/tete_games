part of 'ordering_read_models.dart';

@immutable
class OrderItemPrice {
  final String? currency;
  final num adultPrice;
  final num childPrice;
  final num infantPrice;
  final bool isManual;

  const OrderItemPrice({
    this.currency,
    this.adultPrice = 0.0,
    this.childPrice = 0.0,
    this.infantPrice = 0.0,
    this.isManual = false,
  });
}
