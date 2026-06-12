part of 'reference_data_mappers.dart';

extension CountryDtoMapper on CountryDto {
  Country get toModel => Country(id: id, name: name, isoCode: isoCode);
}
