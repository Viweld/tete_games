part of '../api_core_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class CountryFlagDto {
  @JsonKey(name: 'original')
  final String? original;

  @JsonKey(name: 'large')
  final String? large;

  @JsonKey(name: 'medium')
  final String? medium;

  @JsonKey(name: 'small')
  final String? small;

  const CountryFlagDto({this.original, this.large, this.medium, this.small});

  factory CountryFlagDto.fromJson(Map<String, dynamic> json) => _$CountryFlagDtoFromJson(json);
}
