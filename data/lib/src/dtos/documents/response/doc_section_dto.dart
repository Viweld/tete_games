part of '../documents_dtos.dart';

@JsonSerializable(createToJson: false)
class DocSectionDto {
  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'anchor_id')
  final String anchorId;

  const DocSectionDto({required this.title, required this.content, required this.anchorId});

  factory DocSectionDto.fromJson(Map<String, dynamic> json) => _$DocSectionDtoFromJson(json);
}
