part of 'services_models.dart';

@immutable
class Service {
  final int id;
  final String? airportName;
  final String? marketingName;
  final String? description;
  final int? terminalId;
  final String? terminalName;
  final SimpleCategory? category;
  final SimpleAirport? airport;
  final List<Terminal> terminals;
  final List<Photo> images;
  final Photo? photo;
  final Money? displayPrice;
  final List<ServicePrice> prices;
  final String? priceText;
  final bool isPriceOnRequest;
  final int ordering;
  final bool isPopular;
  final int popularityScore;

  const Service({
    required this.id,
    this.airportName,
    this.marketingName,
    this.description,
    this.terminalId,
    this.terminalName,
    this.category,
    this.airport,
    this.terminals = const <Terminal>[],
    this.images = const <Photo>[],
    this.photo,
    this.displayPrice,
    this.prices = const <ServicePrice>[],
    this.priceText,
    this.isPriceOnRequest = false,
    this.ordering = 0,
    this.isPopular = false,
    this.popularityScore = 0,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Service && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
