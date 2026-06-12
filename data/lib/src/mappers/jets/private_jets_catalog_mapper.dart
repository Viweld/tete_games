part of 'jets_mappers.dart';

extension PrivateJetsCatalogDtoMapper on PrivateJetsCatalogDto {
  PrivateJetsCatalog get toModel => PrivateJetsCatalog(
    category: category?.toModel,
    guides: guides?.map((ServiceGuideDto e) => e.toModel).toList() ?? const <ServiceGuide>[],
    jets: jets?.map((PrivateJetDto e) => e.toModel).toList() ?? const <PrivateJet>[],
    pagination:
        pagination?.toModel ??
        const PrivateJetsPagination(count: 0, page: 1, limit: 0, totalPages: 1),
  );
}
