part of 'repositories.dart';

abstract interface class ServicesOrderingRepository {
  /// Creates a new service order draft.
  Future<OrderDraft> createServiceOrderDraft();

  /// Updates an existing service order draft.
  Future<OrderDraft> updateOrderDraft({required String id, required UpdateOrderRequest request});

  /// Get service order by id.
  Future<OrderDraft> getOrder({required String id});

  /// Requests a verification code to be sent to the specified email
  Future<void> requestCodeToEmail({required String email});

  /// Checks the provided code.
  Future<void> checkCode({
    required String code,
    required String email,
    required String orderDraftId,
  });

  /// Use this when the user clicks "Proceed to Payment".
  Future<OrderDraft> checkoutOrder({required String id});

  /// Finalizes the order and generates a payment link.
  Future<CheckoutPaymentResponse> payOrder({
    required String id,
    required int pointsToUse,
    String? currency,
  });

  /// Mobile fallback endpoint for immediate post-payment reconciliation.
  /// Use this right after PaymentSheet reports success to avoid waiting for delayed Stripe webhook delivery.
  Future<FinalizePaymentResponse> finalizePayment({
    required String orderId,
    required String paymentIntentId,
    required int attempts,
  });
}
