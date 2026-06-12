part of 'transactions_mappers.dart';

extension PaymentMethodStringMapper on String? {
  PaymentMethod get toPaymentMethod => switch (this) {
    'stripe' => PaymentMethod.stripe,
    'points' => PaymentMethod.points,
    'manual' => PaymentMethod.manual,
    _ => PaymentMethod.unknown,
  };
}
