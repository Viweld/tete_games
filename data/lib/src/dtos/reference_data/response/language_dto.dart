part of '../reference_data_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class LanguageDto {
  @JsonKey(name: 'code')
  final String code;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'icons')
  final VectorImageDto? icons;

  const LanguageDto({required this.code, required this.name, this.icons});

  static LanguageDto fromJson(Object json) => _$LanguageDtoFromJson(json as Map<String, dynamic>);
}
