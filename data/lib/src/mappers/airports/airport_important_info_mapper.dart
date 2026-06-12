part of 'airports_mappers.dart';

extension AirportImportantInfoDtoMapper on AirportImportantInfoDto {
  AirportImportantInfo get toModel => AirportImportantInfo(
    rating: parseRatingString(rating),
    reviewsCount: reviewsCount ?? 0,
    workingHoursText: workingHoursText,
    airlines: airlines,
    annualPassengers: annualPassengers,
    freeCancellation: freeCancellation,
    gatesCount: gatesCount,
    address: address,
    distanceToCityCenter: distanceToCityCenter,
    publicTransport: publicTransport,
  );
}
