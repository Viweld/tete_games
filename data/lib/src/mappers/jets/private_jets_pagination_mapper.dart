part of 'jets_mappers.dart';

extension PrivateJetsPaginationDtoMapper on PrivateJetsPaginationDto {
  PrivateJetsPagination get toModel => PrivateJetsPagination(
    count: count ?? 0,
    next: next,
    previous: previous,
    page: page ?? 1,
    limit: limit ?? 0,
    totalPages: totalPages ?? 1,
  );
}
