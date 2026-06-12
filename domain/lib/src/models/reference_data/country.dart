import 'package:flutter/foundation.dart';

@immutable
class Country {
  final int id;
  final String name;
  final String isoCode;

  const Country({required this.id, required this.name, required this.isoCode});
}
