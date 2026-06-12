import 'package:flutter/foundation.dart';

@immutable
class Condition {
  final int id;
  final String key;
  final String title;
  final bool needsText;

  const Condition({
    required this.id,
    required this.key,
    required this.title,
    required this.needsText,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Condition && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
