import 'dart:async';
import 'package:flutter_stripe/flutter_stripe.dart';

/// Exception thrown when stripe payment is canceled.
class StripePaymentCanceledException implements Exception {}

abstract final class StripeService {
  static Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
    required String customerId,
    required String customerEphemeralKeySecret,
    required String merchantDisplayName,
    required String publishableKey,
    String? applePayMerchantId,
    bool? googlePayTestEnv,
    String merchantCountryCode = 'US',
    String? returnURL,
  }) async {
    Stripe.publishableKey = publishableKey;
    if (applePayMerchantId != null) {
      Stripe.merchantIdentifier = applePayMerchantId;
    }

    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        customerId: customerId,
        customerEphemeralKeySecret: customerEphemeralKeySecret,
        merchantDisplayName: merchantDisplayName,
        applePay: applePayMerchantId != null
            ? PaymentSheetApplePay(merchantCountryCode: merchantCountryCode)
            : null,
        googlePay: googlePayTestEnv != null
            ? PaymentSheetGooglePay(
                merchantCountryCode: merchantCountryCode,
                testEnv: googlePayTestEnv,
              )
            : null,
        returnURL: returnURL,
      ),
    );
  }

  static Future<void> presentPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        throw StripePaymentCanceledException();
      }
      rethrow;
    }
  }
}
