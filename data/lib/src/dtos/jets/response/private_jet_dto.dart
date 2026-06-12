part of '../jets_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class PrivateJetDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'marketing_name')
  final String? marketingName;

  @JsonKey(name: 'airport')
  final PrivateJetAirportDto? airport;

  @JsonKey(name: 'model_type')
  final String? modelType;

  @JsonKey(name: 'passengers_capacity')
  final int? passengersCapacity;

  @JsonKey(name: 'range_km')
  final int? rangeKm;

  @JsonKey(name: 'speed_kmh')
  final int? speedKmh;

  @JsonKey(name: 'baggage_kg')
  final int? baggageKg;

  @JsonKey(name: 'cabin_size')
  final String? cabinSize;

  @JsonKey(name: 'starting_from')
  final MoneyDto? startingFrom;

  @JsonKey(name: 'photo')
  final PhotoDto? photo;

  @JsonKey(name: 'guides')
  final List<ServiceGuideDto>? guides;

  const PrivateJetDto({
    required this.id,
    this.marketingName,
    this.airport,
    this.modelType,
    this.passengersCapacity,
    this.rangeKm,
    this.speedKmh,
    this.baggageKg,
    this.cabinSize,
    this.startingFrom,
    this.photo,
    this.guides,
  });

  factory PrivateJetDto.fromJson(Map<String, dynamic> json) => _$PrivateJetDtoFromJson(json);
}
