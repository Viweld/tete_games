part of '../airports_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class AirportImportantInfoDto {
  @JsonKey(name: 'rating')
  final String? rating;

  @JsonKey(name: 'reviews_count')
  final int? reviewsCount;

  @JsonKey(name: 'working_hours_text')
  final String? workingHoursText;

  @JsonKey(name: 'airlines')
  final String? airlines;

  @JsonKey(name: 'annual_passengers')
  final String? annualPassengers;

  @JsonKey(name: 'free_cancellation')
  final String? freeCancellation;

  @JsonKey(name: 'gates_count')
  final String? gatesCount;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'distance_to_city_center')
  final String? distanceToCityCenter;

  @JsonKey(name: 'public_transport')
  final String? publicTransport;

  const AirportImportantInfoDto({
    this.rating,
    this.reviewsCount,
    this.workingHoursText,
    this.airlines,
    this.annualPassengers,
    this.freeCancellation,
    this.gatesCount,
    this.address,
    this.distanceToCityCenter,
    this.publicTransport,
  });

  factory AirportImportantInfoDto.fromJson(Map<String, dynamic> json) =>
      _$AirportImportantInfoDtoFromJson(json);
}
