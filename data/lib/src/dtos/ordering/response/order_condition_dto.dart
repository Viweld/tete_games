part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderConditionDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'key')
  final String? key;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'value')
  final String? value;

  const OrderConditionDto({required this.id, this.key, this.title, this.value});

  factory OrderConditionDto.fromJson(Map<String, dynamic> json) =>
      _$OrderConditionDtoFromJson(json);
}
