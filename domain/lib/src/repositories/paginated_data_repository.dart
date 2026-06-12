part of 'repositories.dart';

typedef PageLoader<T> = Future<PaginatedData<T>> Function(int page, int perPage);

class PaginatedDataRepository<T> {
  final PageLoader<T> _loader;
  PaginationState _state;

  PaginatedDataRepository({required PageLoader<T> loader, int perPage = 20})
    : _loader = loader,
      _state = PaginationState(perPage: perPage);

  PaginationState get state => _state;

  int get page => _state.page;

  int get perPage => _state.perPage;

  Future<List<T>> changePage(int newPage) async {
    _state = _state.copyWith(page: newPage);
    final List<T> result = await _reload();

    return result;
  }

  Future<List<T>> _reload() async {
    final PaginatedData<T> result = await _loader(_state.page, _state.perPage);

    _state = _state.copyWith(page: result.page, perPage: result.perPage, total: result.total);

    return result.data;
  }
}
