import 'package:data/src/dtos/article/article_dtos.dart';
import 'package:domain/domain.dart';

extension ArticleImageCoverMapper on ArticleImageCoverDto {
  ArticleImageCover? get toModel {
    if (original == null || large == null || medium == null || small == null) {
      return null;
    }

    return ArticleImageCover(original: original, large: large, medium: medium, small: small);
  }
}
