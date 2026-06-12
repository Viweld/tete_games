part of 'flight_models.dart';

@immutable
class ServiceGroup {
  final int id;
  final String? slug;
  final String? name;
  final int ordering;
  final bool isPriceOnRequest;
  final List<Service> items;
  final VectorImage? icons;
  final List<ServiceGuide> guides;
  final Photo? image;
  final String? description;
  final String? seoTitle;
  final String? seoDescription;
  final String? workingHoursText;
  final double? rating;
  final int reviewsCount;
  final Money? startingFrom;
  final bool startingFromAutoEnabled;
  final MarketingTag? tag;
  final List<LocationReview> reviews;
  final int? mainGuideId;

  const ServiceGroup({
    required this.id,
    this.slug,
    this.name,
    this.ordering = 0,
    this.isPriceOnRequest = false,
    this.items = const <Service>[],
    this.icons,
    this.guides = const <ServiceGuide>[],
    this.image,
    this.description,
    this.seoTitle,
    this.seoDescription,
    this.workingHoursText,
    this.rating,
    this.reviewsCount = 0,
    this.startingFrom,
    this.startingFromAutoEnabled = false,
    this.tag,
    this.reviews = const <LocationReview>[],
    this.mainGuideId,
  });
}
