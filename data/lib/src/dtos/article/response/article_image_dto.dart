part of '../article_dtos.dart';

@JsonSerializable(createToJson: false)
class ArticleImageDto {
  const ArticleImageDto({required this.id, required this.order, this.image});

  final int id;
  final int order;
  final ArticleImageCoverDto? image;

  factory ArticleImageDto.fromJson(Map<String, dynamic> json) => _$ArticleImageDtoFromJson(json);
}
