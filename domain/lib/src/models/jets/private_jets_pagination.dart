part of 'jets_models.dart';

@immutable
class PrivateJetsPagination {
  final int count;
  final String? next;
  final String? previous;
  final int page;
  final int limit;
  final int totalPages;

  const PrivateJetsPagination({
    required this.count,
    this.next,
    this.previous,
    required this.page,
    required this.limit,
    required this.totalPages,
  });
}
