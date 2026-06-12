part of 'exceptions.dart';

/// Thrown when the user provides an incorrect verification code.
/// Used in both auth code flow and services ordering email code flow.
final class InvalidCodeException implements Exception {
  final String? msg;

  const InvalidCodeException({required this.msg});

  @override
  String toString() => 'InvalidCodeException()';
}
