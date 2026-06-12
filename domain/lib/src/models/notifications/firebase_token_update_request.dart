part of 'notifications.dart';

@immutable
class FirebaseTokenUpdateRequest {
  final String token;
  final String? platform;
  final String? appVersion;

  const FirebaseTokenUpdateRequest({required this.token, this.platform, this.appVersion});
}
