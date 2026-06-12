import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
class AirportDetail {
  final String iataCode;
  final String name;
  final String? city;
  final String? country;
  final String? description;
  final List<Photo> photos;
  final List<Terminal> terminals;
  final List<ServiceGroup> serviceGroups;
  final String? slug;
  final AirportImportantInfo? importantInfo;
  final List<AirportRenderData> airportRenderData;
  final List<LocationReview> reviews;
  final String? status;
  final bool isPublished;
  final int popularityScore;

  const AirportDetail({
    required this.iataCode,
    required this.name,
    this.city,
    this.country,
    this.description,
    this.photos = const <Photo>[],
    this.terminals = const <Terminal>[],
    this.serviceGroups = const <ServiceGroup>[],
    this.slug,
    this.importantInfo,
    this.airportRenderData = const <AirportRenderData>[],
    this.reviews = const <LocationReview>[],
    this.status,
    this.isPublished = false,
    this.popularityScore = 0,
  });
}
