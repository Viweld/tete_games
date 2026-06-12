part of 'exceptions.dart';

final class InvalidAirportRenderDataKeyException implements Exception {
  const InvalidAirportRenderDataKeyException(this.key);

  final String? key;

  @override
  String toString() => 'InvalidAirportRenderDataKeyException(key: $key)';
}
