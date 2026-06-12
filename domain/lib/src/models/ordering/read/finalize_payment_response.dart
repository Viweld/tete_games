part of 'ordering_read_models.dart';

@immutable
class FinalizePaymentResponse {
  final OrderStatus status;
  final bool reconciled;
  final bool awaitingWebhook;
  final String paymentIntentId;
  final bool hasPaymentTransaction;

  const FinalizePaymentResponse({
    required this.status,
    required this.reconciled,
    required this.awaitingWebhook,
    required this.paymentIntentId,
    required this.hasPaymentTransaction,
  });
}
