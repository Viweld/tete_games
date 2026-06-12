part of '../article_dtos.dart';

@JsonSerializable(createToJson: false)
class ArticleImageCoverDto {
  const ArticleImageCoverDto({required this.original, this.large, this.medium, this.small});

  final String? original;
  final String? large;
  final String? medium;
  final String? small;

  factory ArticleImageCoverDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleImageCoverDtoFromJson(json);
}
