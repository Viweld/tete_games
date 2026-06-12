part of 'jets_mappers.dart';

extension PrivateJetAirportDtoMapper on PrivateJetAirportDto {
  PrivateJetAirport get toModel =>
      PrivateJetAirport(id: id, iataCode: iataCode, name: name ?? '', slug: slug ?? '');
}
