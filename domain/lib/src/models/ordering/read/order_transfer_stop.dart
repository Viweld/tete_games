part of 'ordering_read_models.dart';

@immutable
class OrderTransferStop {
  final int id;
  final String? address;
  final int ordering;

  const OrderTransferStop({required this.id, this.address, this.ordering = 0});
}
