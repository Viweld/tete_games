part of 'documents.dart';

@immutable
class DocPage {
  const DocPage({
    required this.slug,
    required this.title,
    this.introText,
    this.sections = const <DocSection>[],
    required this.createdAt,
    required this.updatedAt,
  });

  final String slug;
  final String title;
  final String? introText;
  final List<DocSection> sections;
  final DateTime createdAt;
  final DateTime updatedAt;
}
