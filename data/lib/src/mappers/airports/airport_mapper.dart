part of 'airports_mappers.dart';

extension AirportDtoMapper on AirportDto {
  Airport get toModel => Airport(
    id: id,
    iataCode: iataCode,
    name: name ?? '',
    cityName: cityName,
    countryName: countryName,
    countryCode: countryCode,
    currency: currency?.toModel,
    countryFlag: countryFlag?.toModel,
    photo: photo?.toModel,
    isPopular: isPopular ?? false,
    popularityScore: popularityScore ?? 0,
    tags: tags?.map((AirportTagDto t) => t.toModel).toList() ?? <AirportServiceTag>[],
  );
}
