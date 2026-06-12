import 'package:flutter/foundation.dart';

@immutable
class AirportImportantInfo {
  final double? rating;
  final int reviewsCount;
  final String? workingHoursText;
  final String? airlines;
  final String? annualPassengers;
  final String? freeCancellation;
  final String? gatesCount;
  final String? address;
  final String? distanceToCityCenter;
  final String? publicTransport;

  const AirportImportantInfo({
    this.rating,
    this.reviewsCount = 0,
    this.workingHoursText,
    this.airlines,
    this.annualPassengers,
    this.freeCancellation,
    this.gatesCount,
    this.address,
    this.distanceToCityCenter,
    this.publicTransport,
  });
}
