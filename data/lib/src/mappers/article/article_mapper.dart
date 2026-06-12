import 'package:data/src/dtos/article/article_dtos.dart';
import 'package:data/src/mappers/article/article_image_cover_mapper.dart';
import 'package:domain/domain.dart';

extension ArticleMapper on ArticleDto {
  Article get toModel => Article(
    id: id,
    title: title,
    summary: summary,
    coverImage: coverImage?.toModel,
    isPopular: isPopular,
    popularityScore: popularityScore,
    createdAt: DateTime.parse(createdAt),
    updatedAt: DateTime.parse(updatedAt),
  );
}
