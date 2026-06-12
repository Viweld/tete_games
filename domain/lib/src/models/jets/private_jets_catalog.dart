part of 'jets_models.dart';

@immutable
class PrivateJetsCatalog {
  final PrivateJetCategory? category;
  final List<ServiceGuide> guides;
  final List<PrivateJet> jets;
  final PrivateJetsPagination pagination;

  const PrivateJetsCatalog({
    this.category,
    this.guides = const <ServiceGuide>[],
    this.jets = const <PrivateJet>[],
    required this.pagination,
  });

  ServiceGuide? get numberedGuide =>
      guides.guideByRenderVariant(ServiceGuideRenderVariant.numbered);

  ServiceGuide? get checklistGuide =>
      guides.guideByRenderVariant(ServiceGuideRenderVariant.checklist);

  ServiceGuide? get noteGuide => guides.guideByRenderVariant(ServiceGuideRenderVariant.note);
}
