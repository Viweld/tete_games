import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

abstract class UrlLaunchService {
  /// Open URLs
  static Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
