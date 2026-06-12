// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocPageDto _$DocPageDtoFromJson(Map<String, dynamic> json) => DocPageDto(
  slug: json['slug'] as String,
  title: json['title'] as String,
  introText: json['intro_text'] as String?,
  sections: (json['sections'] as List<dynamic>)
      .map((e) => DocSectionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

DocSectionDto _$DocSectionDtoFromJson(Map<String, dynamic> json) =>
    DocSectionDto(
      title: json['title'] as String,
      content: json['content'] as String,
      anchorId: json['anchor_id'] as String,
    );
