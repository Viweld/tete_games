part of 'repositories.dart';

abstract interface class CancellationRepository {
  /// Get order by number.
  Future<OrderDraft> getOrderByNumber({required String orderNumber, required String email});

  /// Cancel order.
  Future<OrderDraft> cancelOrder({required String orderNumber, required String email});
}
