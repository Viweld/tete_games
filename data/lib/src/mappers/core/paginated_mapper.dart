import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:domain/domain.dart';

extension ApiPaginatedResponseMapper<D> on ApiPaginatedResponse<D> {
  PaginatedList<T> toModel<T>(T Function(D dto) mapper) => PaginatedList<T>(
    count: count,
    next: next,
    previous: previous,
    results: results.map(mapper).toList(),
  );
}
