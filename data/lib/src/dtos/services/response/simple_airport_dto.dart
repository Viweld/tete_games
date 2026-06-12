part of '../services_dtos.dart';

@JsonSerializable()
@immutable
class SimpleAirportDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'iata_code')
  final String? iataCode;
  @JsonKey(name: 'name')
  final String? name;

  const SimpleAirportDto({required this.id, this.iataCode, this.name});

  factory SimpleAirportDto.fromJson(Map<String, dynamic> json) => _$SimpleAirportDtoFromJson(json);
}
