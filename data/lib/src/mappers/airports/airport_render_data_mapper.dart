part of 'airports_mappers.dart';

extension AirportRenderDataDtoMapper on AirportRenderDataDto {
  AirportRenderData get toModel =>
      AirportRenderData(key: parseAirportRenderDataKey(key), value: value ?? '');
}
