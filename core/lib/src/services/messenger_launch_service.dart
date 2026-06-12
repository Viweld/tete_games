import 'dart:async';

import 'package:core/src/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

/// Launches external messengers (WhatsApp, Telegram, etc.).
abstract class MessengerLaunchService {
  static String _normalizePhone(String phone) => phone.replaceAll(RegExp(r'[^\d]'), '');

  static Future<void> _launchExternalUri(Uri uri) async {
    if (!await canLaunchUrl(uri)) {
      throw Exception('Cannot launch URI: $uri');
    }

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Opens a WhatsApp chat: app first (`whatsapp://`), then `https://wa.me/`.
  static Future<void> launchWhatsApp({
    String phoneE164 = AppConstants.privateJetConciergeWhatsAppPhoneE164,
  }) async {
    final String digits = _normalizePhone(phoneE164);
    final Uri appUri = Uri.parse('whatsapp://send?phone=$digits');
    final Uri webUri = Uri.parse('https://wa.me/$digits');

    if (await canLaunchUrl(appUri)) {
      try {
        await launchUrl(appUri, mode: LaunchMode.externalApplication);
        return;
      } on Object {
        // Web fallback below.
      }
    }

    await _launchExternalUri(webUri);
  }
}
