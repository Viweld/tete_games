part of '../article_dtos.dart';

@JsonSerializable(createToJson: false)
class ArticleBodyDto {
  final int id;
  final int? order;
  final String content;
  final List<ArticleImageDto> images;

  const ArticleBodyDto({required this.id, this.order, required this.content, required this.images});

  factory ArticleBodyDto.fromJson(Map<String, dynamic> json) => _$ArticleBodyDtoFromJson(json);
}
