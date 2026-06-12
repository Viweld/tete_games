part of 'core_models.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedData<T> with _$PaginatedData<T> {
  const factory PaginatedData({
    required List<T> data,
    @Default(1) int page,
    @Default(20) int perPage,
    @Default(0) int total,
  }) = _PaginatedData<T>;
}
