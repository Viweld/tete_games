part of 'info.dart';

@immutable
class ArticleImage {
  const ArticleImage({required this.id, required this.order, this.image});

  final int id;
  final int order;
  final ArticleImageCover? image;
}
