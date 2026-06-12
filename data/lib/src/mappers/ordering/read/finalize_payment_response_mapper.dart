part of 'ordering_read_mappers.dart';

extension FinalizePaymentResponseMapper on FinalizePaymentResponseDto {
  FinalizePaymentResponse get toModel => FinalizePaymentResponse(
    status: OrderStatus.fromString(status),
    reconciled: reconciled ?? false,
    awaitingWebhook: awaitingWebhook ?? false,
    paymentIntentId: paymentIntentId ?? '',
    hasPaymentTransaction: hasPaymentTransaction ?? false,
  );
}
