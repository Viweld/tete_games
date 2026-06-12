part of 'ordering_read_mappers.dart';

extension OrderSummaryDtoMapper on OrderSummaryDto {
  OrderSummaryRaw get toModel {
    final List<SummaryItem> items =
        servicesBreakdown?.map((SummaryItemDto e) => e.toModel).toList() ?? <SummaryItem>[];

    return OrderSummaryRaw(
      totalAmount: double.tryParse('$totalAmount') ?? 0,
      currency: currency ?? 'USD',
      servicesBreakdown: items,
    );
  }
}
