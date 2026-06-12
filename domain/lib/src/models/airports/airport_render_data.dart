import 'package:domain/src/models/airports/airport_render_data_key.dart';
import 'package:flutter/foundation.dart';

@immutable
class AirportRenderData {
  final AirportRenderDataKey key;
  final String value;

  const AirportRenderData({required this.key, required this.value});
}
