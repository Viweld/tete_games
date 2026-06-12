import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';

@immutable
class Language {
  final String code;
  final String name;
  final VectorImage? icons;

  const Language({required this.code, required this.name, this.icons});
}
