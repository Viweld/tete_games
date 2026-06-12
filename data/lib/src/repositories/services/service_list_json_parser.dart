import 'dart:convert';
import 'dart:isolate';

import 'package:data/src/dtos/services/services_dtos.dart';
import 'package:data/src/mappers/services/services_mappers.dart';
import 'package:domain/domain.dart';

/// Parses `/locations/services/` JSON off the UI isolate (jsonDecode + DTO + domain).
List<Service> parseServiceListFromJson(String json) {
  final Object? decoded = jsonDecode(json);
  if (decoded is! List<Object?>) {
    throw const FormatException('Expected a JSON array of services');
  }

  return decoded
      .map((Object? item) => ServiceDto.fromJson(item! as Map<String, dynamic>).toModel)
      .toList(growable: false);
}

Future<List<Service>> parseServiceListFromJsonInIsolate(String json) =>
    Isolate.run(() => parseServiceListFromJson(json));
