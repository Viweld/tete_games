part of 'jets_models.dart';

@immutable
class PrivateJet {
  final int id;
  final String marketingName;
  final PrivateJetAirport airport;
  final String modelType;
  final int passengersCapacity;
  final int rangeKm;
  final int speedKmh;
  final int baggageKg;
  final String cabinSize;
  final Money? startingFrom;
  final Photo? photo;
  final List<ServiceGuide> guides;

  const PrivateJet({
    required this.id,
    required this.marketingName,
    required this.airport,
    required this.modelType,
    required this.passengersCapacity,
    required this.rangeKm,
    required this.speedKmh,
    required this.baggageKg,
    required this.cabinSize,
    this.startingFrom,
    this.photo,
    this.guides = const <ServiceGuide>[],
  });

  ServiceGuide? get numberedGuide =>
      guides.guideByRenderVariant(ServiceGuideRenderVariant.numbered);

  ServiceGuide? get checklistGuide =>
      guides.guideByRenderVariant(ServiceGuideRenderVariant.checklist);

  ServiceGuide? get noteGuide => guides.guideByRenderVariant(ServiceGuideRenderVariant.note);
}
