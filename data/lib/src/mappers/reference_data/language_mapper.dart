part of 'reference_data_mappers.dart';

extension LanguageDtoMapper on LanguageDto {
  Language get toModel => Language(code: code, name: name, icons: icons?.toModel);
}
