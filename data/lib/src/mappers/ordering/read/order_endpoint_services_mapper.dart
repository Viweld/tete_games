part of 'ordering_read_mappers.dart';

extension OrderEndpointServicesDtoMapper on OrderEndpointServicesDto {
  OrderEndpointServices get toModel => OrderEndpointServices(
    iataCode: iataCode,
    terminalId: terminalId,
    terminalName: terminalName,
    serviceIds: serviceIds,
    endpointType: switch (endpointType) {
      'departure' => EndpointType.departure,
      'arrival' => EndpointType.arrival,
      'transit' => EndpointType.transit,
      'transit_arrival' => EndpointType.transitArrival,
      'transit_departure' => EndpointType.transitDeparture,
      _ => throw UnsupportedError('Unsupported endpoint type $endpointType'),
    },
  );
}
