part of '../conditions_dtos.dart';

@JsonSerializable(createToJson: false)
class ConditionDto {
  final int id;
  final String key;
  final String title;
  @JsonKey(name: 'needs_text')
  final bool? needsText;

  ConditionDto({required this.id, required this.key, required this.title, this.needsText});

  static ConditionDto fromJson(Map<String, dynamic> json) => _$ConditionDtoFromJson(json);
}
