part of '../jets_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class PrivateJetAirportDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'iata_code')
  final String? iataCode;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'slug')
  final String? slug;

  const PrivateJetAirportDto({required this.id, this.iataCode, this.name, this.slug});

  factory PrivateJetAirportDto.fromJson(Map<String, dynamic> json) =>
      _$PrivateJetAirportDtoFromJson(json);
}
