import 'dart:core';

abstract class AppConstants {
  // TODO(Skeleton): Replace with your Apple Sign In Service ID from Apple Developer portal.
  static const String appleSignInClientId = 'com.example.skeleton';

  // TODO(Skeleton): Replace with your Apple Sign In web client ID if you use the web flow.
  static const String appleSignInWebClientId = 'com.example.skeleton.web';

  static const String supportLink = 'https://t.me/supportBot';
  static const String authCodeTimerKey = 'confirm_code';
  static const String changeEmailCodeTimerKey = 'change_email_code';
  static const String deleteAccountCodeTimerKey = 'delete_account_code';
  static const String orderEmailCodeTimerKey = 'order_email_code';
  static const int authCodeTimeInSeconds = 60;
  static const int changeEmailCodeTimeInSeconds = 60;
  static const int deleteAccountCodeTimeInSeconds = 60;
  static const int orderEmailCodeTimeInSeconds = 60;

  // TODO(Skeleton): Replace with your app support email shown in UI and legal screens.
  static const String supportEmail = 'support@example.com';

  // TODO(Skeleton): Replace or remove — placeholder contacts from skeleton; not tied to a real product.
  static const String privateJetConciergeWhatsAppPhoneE164 = '10000000000';
  static const String privateJetSupportPhone = '+1 (000) 000-00-00';
  static const String contactsWhatsAppPhoneE164 = '10000000000';
  static const String contactsTelegramUrl = 'https://t.me/example';
  static const String contactsInstagramUrl = 'https://www.instagram.com/example_app/';
  static const String contactsEmail = 'info@example.com';
  static const int maxStopsCount = 4;

  // TODO(Skeleton): Replace with your production website base URL (promo links, legal pages).
  static const String basePath = 'https://example.com/';

  static const String promoMobileSegment = 'promo-mobile';

  static String promoMobileUrl(String languageCode) => '$basePath$languageCode/$promoMobileSegment';

  // TODO(Skeleton): Replace with your dev/staging API base URL or rely on `.env.dev` only.
  static const String runtimeTestApiBaseUrl = 'https://api.example.com/api/';

  // TODO(Skeleton): Remove or replace before production — debug-only API unlock password.
  static const String debugApiUnlockPassword = 'ExampleApp2025';

  /// Number of app bar logo taps (profile screen) required to open the API debug dialog.
  static const int debugAppBarLogoTapCount = 10;

  /// Resets the logo tap counter when more than this duration elapses between taps.
  static const Duration debugLogoTapResetTimeout = Duration(seconds: 2);
}
