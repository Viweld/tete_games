part of '../airports_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class TerminalDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'ordering')
  final int? ordering;

  const TerminalDto({required this.id, this.name, this.ordering});

  factory TerminalDto.fromJson(Map<String, dynamic> json) => _$TerminalDtoFromJson(json);
}
