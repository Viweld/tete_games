import 'dart:convert';
import 'dart:isolate';

import 'package:data/src/dtos/airports/airports_dtos.dart';
import 'package:data/src/mappers/airports/airports_mappers.dart';
import 'package:domain/domain.dart';

/// Parses `/locations/airports/{iata_code}/` JSON off the UI isolate (jsonDecode + DTO + domain).
AirportDetail parseAirportDetailFromJson(String json) {
  final Object? decoded = jsonDecode(json);
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('Expected a JSON object for airport detail');
  }

  return AirportDetailDto.fromJson(decoded).toModel;
}

Future<AirportDetail> parseAirportDetailFromJsonInIsolate(String json) =>
    Isolate.run(() => parseAirportDetailFromJson(json));
