part of 'ordering_read_mappers.dart';

extension CheckoutPaymentResponseMapper on CheckoutPaymentResponseDto {
  CheckoutPaymentResponse get toModel => CheckoutPaymentResponse(
    status: OrderStatus.fromString(status),
    cashToPay: double.tryParse(cashToPay ?? '0.0') ?? 0.0,
    pointsUsed: pointsUsed ?? 0,
    discountAmount: double.tryParse(discountAmount ?? '0.0') ?? 0.0,
    cashbackToEarn: cashbackToEarn ?? 0,
    paymentIntent: paymentIntent ?? '',
    customer: customer ?? '',
    ephemeralKey: ephemeralKey ?? '',
    publishableKey: publishableKey ?? '',
  );
}
