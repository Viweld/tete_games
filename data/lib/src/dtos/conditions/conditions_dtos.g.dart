// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conditions_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionDto _$ConditionDtoFromJson(Map<String, dynamic> json) => ConditionDto(
  id: (json['id'] as num).toInt(),
  key: json['key'] as String,
  title: json['title'] as String,
  needsText: json['needs_text'] as bool?,
);

ConditionGroupDto _$ConditionGroupDtoFromJson(Map<String, dynamic> json) =>
    ConditionGroupDto(
      id: (json['id'] as num).toInt(),
      key: json['key'] as String,
      title: json['title'] as String,
      isSingleSelect: json['is_single_select'] as bool?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ConditionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      ordering: (json['ordering'] as num?)?.toInt(),
    );
