part of 'services_mappers.dart';

extension ServicePriceDtoMapper on ServicePriceDto {
  ServicePrice? get toModel {
    if (currency == null || adultPrice == null || childPrice == null || infantPrice == null) {
      return null;
    }

    return ServicePrice(
      currency: currency!,
      adultPrice: _parseDouble(adultPrice),
      childPrice: _parseDouble(childPrice),
      infantPrice: _parseDouble(infantPrice),
    );
  }

  double _parseDouble(Object? value) {
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    return 0.0;
  }
}
