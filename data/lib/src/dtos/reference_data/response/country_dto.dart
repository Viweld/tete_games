part of '../reference_data_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class CountryDto {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'iso_code')
  final String isoCode;

  const CountryDto({required this.id, required this.name, required this.isoCode});

  static CountryDto fromJson(Object json) => _$CountryDtoFromJson(json as Map<String, dynamic>);
}
