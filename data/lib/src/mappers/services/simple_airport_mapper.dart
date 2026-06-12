part of 'services_mappers.dart';

extension SimpleAirportDtoMapper on SimpleAirportDto {
  SimpleAirport get toModel => SimpleAirport(id: id, iataCode: iataCode, name: name ?? '');
}
