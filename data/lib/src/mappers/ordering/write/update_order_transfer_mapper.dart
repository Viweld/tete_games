part of 'ordering_write_mappers.dart';

extension UpdateOrderTransferMapper on UpdateOrderTransfer {
  UpdateOrderTransferDto get toDto {
    final DateFormat outputFormat = DateFormat('yyyy-MM-dd');
    return UpdateOrderTransferDto(
      serviceId: serviceId,
      flightNumber: flightNumber,
      date: date != null ? outputFormat.format(date!) : null,
      time: time,
      pickupAddress: pickupAddress,
      dropoffAddress: dropoffAddress,
      stops: stops,
    );
  }
}
