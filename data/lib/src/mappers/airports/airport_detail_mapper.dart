part of 'airports_mappers.dart';

extension AirportDetailDtoMapper on AirportDetailDto {
  AirportDetail get toModel => AirportDetail(
    iataCode: iataCode,
    name: name ?? '',
    city: city,
    country: country,
    description: description,
    photos: photos?.map((PhotoDto e) => e.toModel).whereType<Photo>().toList() ?? <Photo>[],
    terminals: terminals?.map((TerminalDto e) => e.toModel).toList() ?? <Terminal>[],
    serviceGroups:
        serviceGroups?.map((ServiceGroupDto e) => e.toModel).toList() ?? <ServiceGroup>[],
    slug: slug,
    importantInfo: importantInfo?.toModel,
    airportRenderData:
        airportRenderData?.map((AirportRenderDataDto e) => e.toModel).toList() ??
        <AirportRenderData>[],
    reviews: reviews?.map((LocationReviewDto e) => e.toModel).toList() ?? <LocationReview>[],
    status: status,
    isPublished: isPublished ?? false,
    popularityScore: popularityScore ?? 0,
  );
}
