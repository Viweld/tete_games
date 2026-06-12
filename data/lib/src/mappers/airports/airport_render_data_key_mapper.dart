part of 'airports_mappers.dart';

AirportRenderDataKey parseAirportRenderDataKey(String? value) {
  return switch (value) {
    'gates_count' => AirportRenderDataKey.gatesCount,
    'address' => AirportRenderDataKey.address,
    'distance_to_city_center' => AirportRenderDataKey.distanceToCityCenter,
    'public_transport' => AirportRenderDataKey.publicTransport,
    _ => throw InvalidAirportRenderDataKeyException(value),
  };
}
