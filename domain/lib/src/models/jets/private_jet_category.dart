part of 'jets_models.dart';

@immutable
class PrivateJetCategory {
  final int id;
  final String name;
  final String slug;
  final String? description;
  final String? seoTitle;
  final String? seoDescription;
  final String? workingHoursText;
  final MarketingTag? tag;
  final String? urlPath;

  const PrivateJetCategory({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    this.seoTitle,
    this.seoDescription,
    this.workingHoursText,
    this.tag,
    this.urlPath,
  });
}
