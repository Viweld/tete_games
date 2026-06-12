part of 'ordering_read_mappers.dart';

extension OrderItemDtoMapper on OrderItemDto {
  OrderItem get toModel => OrderItem(
    id: id,
    serviceId: serviceId,
    serviceName: serviceName,
    category: category?.toModel,
    airport: airport?.toModel,
    country: country,
    airportPhoto: airportPhoto?.toModel,
    terminal: terminal?.toModel,
    adultsCount: adultsCount ?? 0,
    childrenCount: childrenCount ?? 0,
    infantsCount: infantsCount ?? 0,
    prices: prices?.map((OrderItemPriceDto e) => e.toModel).toList() ?? const <OrderItemPrice>[],
    totalPrice: '$totalPrice',
    currency: currency,
    currencySymbol: currencySymbol,
  );
}
