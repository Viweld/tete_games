part of '../repositories.dart';

@LazySingleton(as: OrdersRepository)
class OrdersRepositoryImpl implements OrdersRepository {
  final OrderingApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  late final StreamController<List<OrderDraft>> _draftsStreamController;
  late final StreamController<List<OrderDraft>> _upcomingOrdersStreamController;
  late final StreamController<List<OrderDraft>> _completedOrdersStreamController;
  late final StreamController<List<OrderDraft>> _cancelledOrdersStreamController;

  OrdersRepositoryImpl(this._provider, this._apiCallWrapper) {
    _draftsStreamController = StreamController<List<OrderDraft>>.broadcast();
    _upcomingOrdersStreamController = StreamController<List<OrderDraft>>.broadcast();
    _completedOrdersStreamController = StreamController<List<OrderDraft>>.broadcast();
    _cancelledOrdersStreamController = StreamController<List<OrderDraft>>.broadcast();
  }

  @override
  Stream<List<OrderDraft>> get draftsStream => _draftsStreamController.stream;

  @override
  Stream<List<OrderDraft>> get upcomingOrdersStream => _upcomingOrdersStreamController.stream;

  @override
  Stream<List<OrderDraft>> get completedOrdersStream => _completedOrdersStreamController.stream;

  @override
  Stream<List<OrderDraft>> get cancelledOrdersStream => _cancelledOrdersStreamController.stream;

  @override
  Future<void> fetchAllOrders() => Future.wait(<Future<Object?>>[
    fetchDrafts(),
    fetchUpcomingOrders(),
    fetchCompletedOrders(),
    fetchCancelledOrders(),
  ]);

  @override
  Future<void> fetchDrafts() async {
    final List<OrderDto> response = await _apiCallWrapper.call(
      () => _provider.getUserOrders(statusGroup: 'drafts'),
    );
    final List<OrderDraft> orders = response.map((OrderDto e) => e.toModel).toList();

    if (_draftsStreamController.isClosed) return;
    _draftsStreamController.add(orders);
  }

  @override
  Future<void> fetchUpcomingOrders() async {
    final List<OrderDto> response = await _apiCallWrapper.call(
      () => _provider.getUserOrders(statusGroup: 'upcoming'),
    );
    final List<OrderDraft> orders = response.map((OrderDto e) => e.toModel).toList();

    if (_upcomingOrdersStreamController.isClosed) return;
    _upcomingOrdersStreamController.add(orders);
  }

  @override
  Future<void> fetchCompletedOrders() async {
    final List<OrderDto> response = await _apiCallWrapper.call(
      () => _provider.getUserOrders(statusGroup: 'completed'),
    );
    final List<OrderDraft> orders = response.map((OrderDto e) => e.toModel).toList();

    if (_completedOrdersStreamController.isClosed) return;
    _completedOrdersStreamController.add(orders);
  }

  @override
  Future<void> fetchCancelledOrders() async {
    final List<OrderDto> response = await _apiCallWrapper.call(
      () => _provider.getUserOrders(statusGroup: 'cancelled'),
    );
    final List<OrderDraft> orders = response.map((OrderDto e) => e.toModel).toList();

    if (_cancelledOrdersStreamController.isClosed) return;
    _cancelledOrdersStreamController.add(orders);
  }

  @override
  Future<OrderDraft> getOrder({required String id}) async {
    final OrderDto response = await _apiCallWrapper.call(() => _provider.getOrder(id: id));
    return response.toModel;
  }

  @override
  Future<void> deleteDraft({required String id}) async {
    await _apiCallWrapper.call(() => _provider.deleteDraft(id: id));
  }

  @override
  Future<void> close() async {
    await _draftsStreamController.close();
    await _upcomingOrdersStreamController.close();
    await _completedOrdersStreamController.close();
    await _cancelledOrdersStreamController.close();
  }
}
