import 'package:data/src/dtos/article/article_dtos.dart';
import 'package:data/src/mappers/article/article_image_mapper.dart';
import 'package:domain/domain.dart';

extension ArticleBodyMapper on ArticleBodyDto {
  ArticleBody get toModel => ArticleBody(
    id: id,
    order: order ?? 0,
    content: content,
    images: images.map((ArticleImageDto t) => t.toModel).toList(),
  );
}
