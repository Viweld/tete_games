import 'package:flutter/foundation.dart';

@immutable
class Currency {
  final String code;
  final String symbol;
  final String? name;

  const Currency({required this.code, required this.symbol, required this.name});
}
