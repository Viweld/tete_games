part of 'ordering_read_models.dart';

enum OrderType {
  service,
  transfer,
  unknown;

  static OrderType fromString(String? value) {
    return OrderType.values.firstWhere(
      (OrderType e) => e.name == value,
      orElse: () => OrderType.unknown,
    );
  }
}
