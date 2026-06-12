import 'package:flutter/foundation.dart';

@immutable
class UserNotification {
  const UserNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    this.payload = const <String, dynamic>{},
  });

  final int id;
  final String title;
  final String body;
  final DateTime createdAt;
  final Map<String, dynamic> payload;
}
