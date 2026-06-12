part of 'ordering_read_mappers.dart';

extension OrderTransferDtoMapper on OrderTransferDto {
  OrderTransfer get toModel => OrderTransfer(
    id: id,
    date: date,
    time: time,
    pickupAddress: pickupAddress,
    dropoffAddress: dropoffAddress,
    flightNumber: flightNumber,
    serviceId: serviceId,
    serviceName: serviceName,
    category: category?.toModel,
    airport: airport?.toModel,
    terminal: terminal?.toModel,
    isPaid: isPaid ?? false,
    paymentAmount: double.tryParse('$paymentAmount'),
    paymentCurrency: paymentCurrency ?? 'USD',
    stopsList:
        stopsList?.map((OrderTransferStopDto e) => e.toModel).toList() ??
        const <OrderTransferStop>[],
  );
}

extension OrderTransferStopDtoMapper on OrderTransferStopDto {
  OrderTransferStop get toModel =>
      OrderTransferStop(id: id, address: address, ordering: ordering ?? 0);
}
