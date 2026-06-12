import 'package:data/src/dtos/article/article_dtos.dart';
import 'package:data/src/mappers/article/article_image_cover_mapper.dart';
import 'package:domain/domain.dart';

extension ArticleImageMapper on ArticleImageDto {
  ArticleImage get toModel => ArticleImage(id: id, order: order, image: image?.toModel);
}
