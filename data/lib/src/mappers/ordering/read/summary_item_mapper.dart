part of 'ordering_read_mappers.dart';

extension SummaryItemDtoMapper on SummaryItemDto {
  SummaryItem get toModel => SummaryItem(
    name: name ?? '',
    pricePerUnit: double.tryParse('$pricePerUnit') ?? 0,
    currency: currency ?? 'USD',
    count: count ?? 0,
    total: double.tryParse('$total') ?? 0,
    note: note,
    endpointType: endpointType != null
        ? switch (endpointType) {
            'departure' => EndpointType.departure,
            'arrival' => EndpointType.arrival,
            'transit' => EndpointType.transit,
            'transit_arrival' => EndpointType.transitArrival,
            'transit_departure' => EndpointType.transitDeparture,
            _ => null,
          }
        : null,
    iataCode: iataCode,
    terminalName: terminalName,
    passengersCount: passengersCount,
    serviceId: serviceId,
    pickupAddress: pickupAddress,
    dropoffAddress: dropoffAddress,
    transferId: transferId,
    stopsList:
        stopsList?.map((OrderTransferStopDto e) => e.toModel).toList() ??
        const <OrderTransferStop>[],
  );
}
