part of '../repositories.dart';

@LazySingleton(as: ServicesOrderingRepository)
class ServicesOrderingRepositoryImpl implements ServicesOrderingRepository {
  final OrderingApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  ServicesOrderingRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<OrderDraft> createServiceOrderDraft() async {
    final OrderDto response = await _apiCallWrapper.call(
      () => _provider.createOrder(body: const CreateOrderRequestDto(type: 'service')),
    );
    return response.toModel;
  }

  @override
  Future<OrderDraft> updateOrderDraft({
    required String id,
    required UpdateOrderRequest request,
  }) async {
    try {
      final OrderDto response = await _apiCallWrapper.call(
        () => _provider.updateBookingData(id: id, body: request.toDto),
      );
      return response.toModel;
    } on OtherException catch (e) {
      if (e.statusCode == 400) throw UpdateOrderException(msg: e.userMessage);
      rethrow;
    }
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

  @override
  Future<FinalizePaymentResponse> finalizePayment({
    required String orderId,
    required String paymentIntentId,
    required int attempts,
  }) async {
    final FinalizePaymentResponseDto response = await _apiCallWrapper.call(
      () => _provider.confirmMobilePayment(
        id: orderId,
        body: FinalizeMobilePaymentRequestDto(
          paymentIntentId: _stripePaymentIntentId(paymentIntentId),
          attempts: attempts,
        ),
      ),
    );

    return response.toModel;
  }

  static String _stripePaymentIntentId(String paymentIntentClientSecretOrId) {
    const String separator = '_secret_';
    final int i = paymentIntentClientSecretOrId.indexOf(separator);
    if (i == -1) {
      return paymentIntentClientSecretOrId;
    }
    return paymentIntentClientSecretOrId.substring(0, i);
  }
}
