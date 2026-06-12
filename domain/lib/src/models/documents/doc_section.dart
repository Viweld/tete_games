part of 'documents.dart';

@immutable
class DocSection {
  const DocSection({required this.title, required this.content, required this.anchorId});

  final String title;
  final String content;
  final String anchorId;
}
