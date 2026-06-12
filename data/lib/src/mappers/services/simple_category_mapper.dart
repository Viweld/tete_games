part of 'services_mappers.dart';

extension SimpleCategoryDtoMapper on SimpleCategoryDto {
  SimpleCategory get toModel => SimpleCategory(
    id: id,
    name: name ?? '',
    image: image?.toModel,
    categoryType: switch (slug) {
      'vipLounge' => CategoryType.vipLounge,
      'transfer' => CategoryType.transfer,
      _ => CategoryType.other,
    },
  );
}
