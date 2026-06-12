part of 'services_mappers.dart';

extension ServiceDtoMapper on ServiceDto {
  Service get toModel => Service(
    id: id,
    airportName: airportName,
    marketingName: marketingName,
    description: description,
    terminalId: terminalId,
    terminalName: terminalName,
    category: category?.toModel,
    airport: airport?.toModel,
    terminals:
        terminals?.map((TerminalDto e) => e.toModel).whereType<Terminal>().toList() ?? <Terminal>[],
    images: images?.map((PhotoDto e) => e.toModel).whereType<Photo>().toList() ?? <Photo>[],
    photo: photo?.toModel,
    displayPrice: displayPrice?.toModel,
    prices:
        prices?.map((ServicePriceDto price) => price.toModel).whereType<ServicePrice>().toList() ??
        <ServicePrice>[],
    priceText: priceText,
    isPriceOnRequest: isPriceOnRequest ?? false,
    ordering: ordering ?? 0,
    isPopular: isPopular ?? false,
    popularityScore: popularityScore ?? 0,
  );
}
