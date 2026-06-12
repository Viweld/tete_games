part of '../repositories.dart';

@LazySingleton(as: CancellationRepository)
class CancellationRepositoryImpl implements CancellationRepository {
  final OrderingApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  CancellationRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<OrderDraft> cancelOrder({required String orderNumber, required String email}) async {
    final OrderDto response = await _apiCallWrapper.call(
      () => _provider.cancelOrder(
        body: CancelOrderRequestDto(orderNumber: orderNumber, email: email),
      ),
    );

    return response.toModel;
  }

  @override
  Future<OrderDraft> getOrderByNumber({required String orderNumber, required String email}) async {
    try {
      final OrderDto response = await _apiCallWrapper.call(
        () => _provider.getOrderByRef(refNumber: orderNumber, contactEmail: email),
      );

      return response.toModel;
    } on OtherException catch (e) {
      if (e.statusCode == 404) throw const OrderNotFoundException();
      rethrow;
    }
  }
}
