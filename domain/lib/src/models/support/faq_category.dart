part of 'support.dart';

@immutable
class FaqCategory {
  final int id;
  final String name;
  final String slug;
  final List<FaqItem> items;

  const FaqCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.items,
  });
}
