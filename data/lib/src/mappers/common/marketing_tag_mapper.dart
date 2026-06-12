part of 'common_mappers.dart';

extension MarketingTagDtoMapper on MarketingTagDto {
  MarketingTag get toModel => MarketingTag(
    label: label ?? '',
    backgroundColor: parseHexColor(bgColor),
    textColor: parseHexColor(textColor),
  );
}
