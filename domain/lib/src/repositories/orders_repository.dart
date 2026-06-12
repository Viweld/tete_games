part of 'repositories.dart';

abstract interface class OrdersRepository {
  /// Stream of of drafts.
  Stream<List<OrderDraft>> get draftsStream;

  /// Stream of upcoming orders.
  Stream<List<OrderDraft>> get upcomingOrdersStream;

  /// Stream of completed orders.
  Stream<List<OrderDraft>> get completedOrdersStream;

  /// Stream of cancelled orders.
  Stream<List<OrderDraft>> get cancelledOrdersStream;

  /// Fetches the list of all orders.
  Future<void> fetchAllOrders();

  /// Fetches the list of drafts.
  Future<void> fetchDrafts();

  /// Fetches the list of upcoming orders.
  Future<void> fetchUpcomingOrders();

  /// Fetches the list of completed orders.
  Future<void> fetchCompletedOrders();

  /// Fetches the list of cancelled orders.
  Future<void> fetchCancelledOrders();

  /// Get service order by id.
  Future<OrderDraft> getOrder({required String id});

  /// Delete order draft by id.
  Future<void> deleteDraft({required String id});

  /// Closes the repository and its streams.
  Future<void> close();
}
