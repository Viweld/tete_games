part of 'notifications.dart';

@immutable
class FirebaseTokenUpdateResult {
  final bool success;
  final int tokenId;
  final bool isActive;

  const FirebaseTokenUpdateResult({
    required this.success,
    required this.tokenId,
    required this.isActive,
  });
}
