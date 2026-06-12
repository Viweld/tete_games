import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/ordering/ordering_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'ordering_api_provider.g.dart';

@RestApi()
@injectable
abstract class OrderingApiProvider {
  @factoryMethod
  factory OrderingApiProvider(Dio dio) = _OrderingApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/orders/')
  Future<List<OrderDto>> getUserOrders({
    @Query('lang') String? lang,
    @Query('status_group') String? statusGroup,
  });

  @POST('${ApiProvidersVersions.apiVersion}/orders/')
  Future<OrderDto> createOrder({@Body() required CreateOrderRequestDto body});

  @PATCH('${ApiProvidersVersions.apiVersion}/orders/{id}/')
  Future<OrderDto> updateBookingData({
    @Path('id') required String id,
    @Body() required UpdateOrderRequestDto body,
  });

  @GET('${ApiProvidersVersions.apiVersion}/orders/{id}/')
  Future<OrderDto> getOrder({@Path('id') required String id});

  @POST('${ApiProvidersVersions.apiVersion}/orders/email/request/')
  Future<void> requestEmailVerificationCode({@Body() required VerifyEmailRequestCodeDto body});

  @POST('${ApiProvidersVersions.apiVersion}/orders/email/verify/')
  Future<void> verifyEmailCode({@Body() required VerifyEmailSubmitCodeDto body});

  @POST('${ApiProvidersVersions.apiVersion}/orders/{id}/checkout-info/')
  Future<OrderDto> checkoutOrder({@Path('id') required String id});

  @POST('${ApiProvidersVersions.apiVersion}/orders/{id}/checkout/pay-mobile/')
  Future<CheckoutPaymentResponseDto> processPayment({
    @Path('id') required String id,
    @Query('lang') String? lang,
    @Body() required CheckoutPaymentRequestDto body,
  });

  @POST('${ApiProvidersVersions.apiVersion}/orders/{id}/checkout/pay-mobile/confirm/')
  Future<FinalizePaymentResponseDto> confirmMobilePayment({
    @Path('id') required String id,
    @Query('lang') String? lang,
    @Body() required FinalizeMobilePaymentRequestDto body,
  });

  @DELETE('${ApiProvidersVersions.apiVersion}/orders/{id}/draft/')
  Future<void> deleteDraft({@Path('id') required String id});

  @POST('${ApiProvidersVersions.apiVersion}/orders/cancel-by-ref/')
  Future<OrderDto> cancelOrder({@Body() required CancelOrderRequestDto body});

  @GET('${ApiProvidersVersions.apiVersion}/orders/by-ref/')
  Future<OrderDto> getOrderByRef({
    @Query('ref_number') required String refNumber,
    @Query('contact_email') required String contactEmail,
    @Query('lang') String? lang,
  });

  @POST('${ApiProvidersVersions.apiVersion}/orders/private-jet/book/')
  Future<OrderDto> bookPrivateJet({
    @Query('lang') String? lang,
    @Body() required PrivateJetBookingRequestDto body,
  });
}
