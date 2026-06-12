part of '../notifications_dtos.dart';

@JsonSerializable()
@immutable
class MarkNotificationReadAllRequestDto {
  @JsonKey(name: 'mark_all')
  final bool markAll;

  const MarkNotificationReadAllRequestDto({this.markAll = false});

  factory MarkNotificationReadAllRequestDto.fromJson(Map<String, dynamic> json) =>
      _$MarkNotificationReadAllRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MarkNotificationReadAllRequestDtoToJson(this);
}
