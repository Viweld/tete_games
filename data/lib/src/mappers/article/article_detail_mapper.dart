import 'package:data/src/dtos/article/article_dtos.dart';
import 'package:data/src/mappers/article/article_body_mapper.dart';
import 'package:data/src/mappers/article/article_image_cover_mapper.dart';
import 'package:data/src/mappers/article/article_image_mapper.dart';
import 'package:domain/domain.dart';

extension ArticleDetailMapper on ArticleDetailDto {
  ArticleDetail get toModel => ArticleDetail(
    id: id,
    title: title,
    summary: summary,
    coverImage: coverImage?.toModel,
    isPopular: isPopular,
    popularityScore: popularityScore,
    createdAt: DateTime.parse(createdAt),
    updatedAt: DateTime.parse(updatedAt),
    bodies: bodies.map((ArticleBodyDto t) => t.toModel).toList(),
    carouselImages: carouselImages!.map((ArticleImageDto t) => t.toModel).toList(),
  );
}
