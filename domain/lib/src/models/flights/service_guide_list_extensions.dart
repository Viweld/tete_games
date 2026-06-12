part of 'flight_models.dart';

extension ServiceGuideListX on List<ServiceGuide> {
  ServiceGuide? guideByRenderVariant(ServiceGuideRenderVariant variant) {
    for (final ServiceGuide guide in this) {
      if (guide.renderVariant == variant) {
        return guide;
      }
    }
    return null;
  }
}
