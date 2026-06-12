import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:domain/domain.dart';

extension MoneyDtoMapper on MoneyDto {
  Money? get toModel {
    if (amount == null || currency == null) return null;

    final double parsedAmount = double.tryParse('$amount') ?? 0.0;

    return Money(amount: parsedAmount, currency: currency!);
  }
}
