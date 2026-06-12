part of 'ordering_write_mappers.dart';

extension UpdateOrderEndpointServicesMapper on UpdateOrderEndpointServices {
  UpdateOrderEndpointServicesDto get toDto => UpdateOrderEndpointServicesDto(
    iataCode: iataCode,
    terminalId: effectiveTerminalIdForApi(terminalId),
    terminalName: terminalName,
    serviceIds: serviceIds,
    endpointType: switch (endpointType) {
      EndpointType.departure => 'departure',
      EndpointType.arrival => 'arrival',
      EndpointType.transit => 'transit',
      EndpointType.transitArrival => 'transit_arrival',
      EndpointType.transitDeparture => 'transit_departure',
    },
  );
}
