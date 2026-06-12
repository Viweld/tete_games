part of '../conditions_dtos.dart';

@JsonSerializable(createToJson: false)
class ConditionGroupDto {
  final int id;
  final String key;
  final String title;
  @JsonKey(name: 'is_single_select')
  final bool? isSingleSelect;
  final List<ConditionDto>? items;
  final int? ordering;

  ConditionGroupDto({
    required this.id,
    required this.key,
    required this.title,
    this.isSingleSelect,
    this.items,
    this.ordering,
  });

  static ConditionGroupDto fromJson(Map<String, dynamic> json) => _$ConditionGroupDtoFromJson(json);
}
