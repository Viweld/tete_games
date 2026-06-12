part of '../repositories.dart';

@LazySingleton(as: TransfersOrderingRepository)
class TransfersOrderingRepositoryImpl implements TransfersOrderingRepository {
  final OrderingApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  TransfersOrderingRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<OrderDraft> createTransferOrderDraft() async {
    final OrderDto response = await _apiCallWrapper.call(
      () => _provider.createOrder(body: const CreateOrderRequestDto(type: 'transfer')),
    );
    return response.toModel;
  }

  @override
  Future<OrderDraft> updateOrderDraft({
    required String id,
    required UpdateOrderRequest request,
  }) async {
    final OrderDto response = await _apiCallWrapper.call(
      () => _provider.updateBookingData(id: id, body: request.toDto),
    );
    return response.toModel;
  }

  @override
  Future<OrderDraft> getOrder({required String id}) async {
    final OrderDto response = await _apiCallWrapper.call(() => _provider.getOrder(id: id));
    return response.toModel;
  }

  @override
  Future<void> requestCodeToEmail({required String email}) async {
    await _apiCallWrapper.call(
      () => _provider.requestEmailVerificationCode(body: VerifyEmailRequestCodeDto(email: email)),
    );
  }

  @override
  Future<void> checkCode({
    required String code,
    required String email,
    required String orderDraftId,
  }) async {
    try {
      await _apiCallWrapper.call(
        () => _provider.verifyEmailCode(
          body: VerifyEmailSubmitCodeDto(email: email, code: code, orderId: orderDraftId),
        ),
      );
    } on OtherException catch (e) {
      if (e.statusCode == 400) throw InvalidCodeException(msg: e.userMessage);
      rethrow;
    }
  }

  @override
  Future<OrderDraft> checkoutOrder({required String id}) async {
    final OrderDto response = await _apiCallWrapper.call(() => _provider.checkoutOrder(id: id));
    return response.toModel;
  }

  @override
  Future<CheckoutPaymentResponse> payOrder({
    required String id,
    required int pointsToUse,
    String? currency,
  }) async {
    final CheckoutPaymentResponseDto response = await _apiCallWrapper.call(
      () => _provider.processPayment(
        id: id,
        body: CheckoutPaymentRequestDto(pointsToUse: pointsToUse, currency: currency),
      ),
    );

    return response.toModel;
  }
}
