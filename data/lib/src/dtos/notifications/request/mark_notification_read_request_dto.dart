part of '../notifications_dtos.dart';

@JsonSerializable()
@immutable
class MarkNotificationReadRequestDto {
  @JsonKey(name: 'ids')
  final List<int>? ids;

  const MarkNotificationReadRequestDto({this.ids});

  factory MarkNotificationReadRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationReadRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MarkNotificationReadRequestDtoToJson(this);
}
