part of 'jets_mappers.dart';

extension PrivateJetCategoryDtoMapper on PrivateJetCategoryDto {
  PrivateJetCategory get toModel => PrivateJetCategory(
    id: id,
    name: name ?? '',
    slug: slug ?? '',
    description: description,
    seoTitle: seoTitle,
    seoDescription: seoDescription,
    workingHoursText: workingHoursText,
    tag: tag?.toModel,
    urlPath: urlPath,
  );
}
