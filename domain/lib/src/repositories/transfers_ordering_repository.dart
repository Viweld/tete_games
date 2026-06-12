part of 'repositories.dart';

abstract interface class TransfersOrderingRepository {
  /// Creates a new transfer order draft.
  Future<OrderDraft> createTransferOrderDraft();

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
}
