import 'package:flutter/foundation.dart';

@immutable
class Terminal {
  final int id;
  final String name;
  final int ordering;

  const Terminal({required this.id, required this.name, this.ordering = 0});
}
