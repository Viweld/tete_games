part of 'ordering_read_models.dart';

@immutable
class OrderItem {
  final int id;
  final int? serviceId;
  final String? serviceName;
  final SimpleCategory? category;
  final SimpleAirport? airport;
  final String? country;
  final Photo? airportPhoto;
  final Terminal? terminal;
  final int adultsCount;
  final int childrenCount;
  final int infantsCount;
  final List<OrderItemPrice> prices;
  final String? totalPrice;
  final String? currency;
  final String? currencySymbol;

  const OrderItem({
    required this.id,
    this.serviceId,
    this.serviceName,
    this.category,
    this.airport,
    this.country,
    this.airportPhoto,
    this.terminal,
    this.adultsCount = 0,
    this.childrenCount = 0,
    this.infantsCount = 0,
    this.prices = const <OrderItemPrice>[],
    this.totalPrice,
    this.currency,
    this.currencySymbol,
  });
}
