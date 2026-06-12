import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

/// Launches the system phone dialer (`tel:`).
///
/// Separate from messenger launch flows: telephony and messengers use different
/// URI schemes; extend this service for SMS, FaceTime, etc.
abstract class PhoneLaunchService {
  static Future<void> launchDialer(String phoneNumber) async {
    final String normalized = phoneNumber.replaceAll(RegExp(r'[^\d+#*]'), '');
    final Uri uri = Uri(scheme: 'tel', path: normalized);

    if (!await canLaunchUrl(uri)) {
      throw Exception('Cannot launch dialer for: $phoneNumber');
    }

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
