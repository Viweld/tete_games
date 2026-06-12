part of 'ordering_read_mappers.dart';

extension OrderItemPriceDtoMapper on OrderItemPriceDto {
  OrderItemPrice get toModel => OrderItemPrice(
    currency: currency,
    adultPrice: adultPrice ?? 0.0,
    childPrice: childPrice ?? 0.0,
    infantPrice: infantPrice ?? 0.0,
    isManual: isManual ?? false,
  );
}
