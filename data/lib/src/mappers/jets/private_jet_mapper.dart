part of 'jets_mappers.dart';

extension PrivateJetDtoMapper on PrivateJetDto {
  PrivateJet get toModel {
    final PrivateJetAirportDto? airportDto = airport;
    if (airportDto == null) {
      throw StateError('Private jet $id is missing airport');
    }

    return PrivateJet(
      id: id,
      marketingName: marketingName ?? '',
      airport: airportDto.toModel,
      modelType: modelType ?? '',
      passengersCapacity: passengersCapacity ?? 0,
      rangeKm: rangeKm ?? 0,
      speedKmh: speedKmh ?? 0,
      baggageKg: baggageKg ?? 0,
      cabinSize: cabinSize ?? '',
      startingFrom: startingFrom?.toModel,
      photo: photo?.toModel,
      guides: guides?.map((ServiceGuideDto e) => e.toModel).toList() ?? const <ServiceGuide>[],
    );
  }
}
