part of 'exceptions.dart';

/// Thrown when the user try to update Order (or order draft).
final class UpdateOrderException implements Exception {
  final String? msg;

  const UpdateOrderException({required this.msg});

  @override
  String toString() => 'UpdateOrderException()';
}
