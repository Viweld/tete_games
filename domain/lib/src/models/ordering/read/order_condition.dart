part of 'ordering_read_models.dart';

@immutable
class OrderCondition {
  final int id;
  final String? key;
  final String? title;
  final String? value;

  const OrderCondition({required this.id, this.key, this.title, this.value});
}
