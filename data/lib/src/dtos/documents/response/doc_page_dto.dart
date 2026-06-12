part of '../documents_dtos.dart';

@JsonSerializable(createToJson: false)
class DocPageDto {
  @JsonKey(name: 'slug')
  final String slug;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'intro_text')
  final String? introText;

  @JsonKey(name: 'sections')
  final List<DocSectionDto> sections;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  const DocPageDto({
    required this.slug,
    required this.title,
    this.introText,
    required this.sections,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DocPageDto.fromJson(Map<String, dynamic> json) => _$DocPageDtoFromJson(json);
}
