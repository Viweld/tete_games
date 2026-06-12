part of 'core_models.dart';

@freezed
abstract class PaginationState with _$PaginationState {
  const factory PaginationState({
    @Default(1) int page,
    @Default(20) int perPage,
    @Default(0) int total,
  }) = _PaginationState;

  const PaginationState._();

  bool get hasMore {
    if (total == 0) return false;

    final bool result = (page * perPage) < total;

    return result;
  }
}
