part of 'info.dart';

@immutable
class ArticleImageCover {
  const ArticleImageCover({this.original, this.large, this.medium, this.small});

  final String? original;
  final String? large;
  final String? medium;
  final String? small;
}
