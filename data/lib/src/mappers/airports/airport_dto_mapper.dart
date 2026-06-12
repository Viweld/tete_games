part of 'airports_mappers.dart';

extension AirportTagDtoMapper on AirportTagDto {
  AirportServiceTag get toModel =>
      AirportServiceTag(label: label ?? '', color: parseHexColor(backgroundColor));
}
