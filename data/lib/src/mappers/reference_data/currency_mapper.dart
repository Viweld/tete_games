part of 'reference_data_mappers.dart';

extension CurrencyDtoMapper on CurrencyDto {
  Currency get toModel => Currency(code: code, name: name, symbol: symbol);
}
