part of 'flight_models.dart';

@immutable
class ServiceGuide {
  final String title;
  final String description;
  final String? color;
  final int ordering;
  final ServiceGuideRenderVariant renderVariant;
  final bool isMain;

  const ServiceGuide({
    required this.title,
    required this.description,
    this.color,
    this.ordering = 0,
    this.renderVariant = ServiceGuideRenderVariant.unknown,
    this.isMain = false,
  });

  List<String>? get descriptionItems => ServiceGuideDescriptionParser.parse(description);
}
