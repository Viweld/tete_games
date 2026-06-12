part of '../airports_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class AirportDetailDto {
  @JsonKey(name: 'iataCode')
  final String iataCode;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'city')
  final String? city;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'description')
  final String? description;

  @JsonKey(name: 'photos')
  final List<PhotoDto>? photos;

  @JsonKey(name: 'terminals')
  final List<TerminalDto>? terminals;

  @JsonKey(name: 'serviceGroups')
  final List<ServiceGroupDto>? serviceGroups;

  @JsonKey(name: 'slug')
  final String? slug;

  @JsonKey(name: 'importantInfo')
  final AirportImportantInfoDto? importantInfo;

  @JsonKey(name: 'airportRenderData')
  final List<AirportRenderDataDto>? airportRenderData;

  @JsonKey(name: 'reviews')
  final List<LocationReviewDto>? reviews;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'isPublished')
  final bool? isPublished;

  @JsonKey(name: 'popularityScore')
  final int? popularityScore;

  const AirportDetailDto({
    required this.iataCode,
    this.name,
    this.city,
    this.country,
    this.description,
    this.photos,
    this.terminals,
    this.serviceGroups,
    this.slug,
    this.importantInfo,
    this.airportRenderData,
    this.reviews,
    this.status,
    this.isPublished,
    this.popularityScore,
  });

  factory AirportDetailDto.fromJson(Map<String, dynamic> json) => _$AirportDetailDtoFromJson(json);
}
