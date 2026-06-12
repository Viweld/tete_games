part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class UpdateOrderConditionDto {
  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'text')
  final String? text;

  const UpdateOrderConditionDto({this.id, this.text});

  Map<String, dynamic> toJson() => _$UpdateOrderConditionDtoToJson(this);
}
