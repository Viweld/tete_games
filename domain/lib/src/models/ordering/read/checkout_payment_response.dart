part of 'ordering_read_models.dart';

@immutable
class CheckoutPaymentResponse {
  final OrderStatus status;
  final double cashToPay;
  final int pointsUsed;
  final double discountAmount;
  final int cashbackToEarn;
  final String paymentIntent;
  final String customer;
  final String ephemeralKey;
  final String publishableKey;

  const CheckoutPaymentResponse({
    required this.status,
    required this.cashToPay,
    required this.pointsUsed,
    required this.discountAmount,
    required this.cashbackToEarn,
    required this.paymentIntent,
    required this.customer,
    required this.ephemeralKey,
    required this.publishableKey,
  });
}
