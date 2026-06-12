part of 'core_models.dart';

@immutable
class PaginatedList<T> {
  final int count;
  final String? next;
  final String? previous;
  final List<T> results;

  const PaginatedList({required this.count, this.next, this.previous, required this.results});
}
