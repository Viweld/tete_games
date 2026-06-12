part of '../repositories.dart';

@LazySingleton(as: PrivateJetsOrderingRepository)
class PrivateJetsOrderingRepositoryImpl implements PrivateJetsOrderingRepository {
  final OrderingApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  PrivateJetsOrderingRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<OrderDraft> bookPrivateJet({
    required PrivateJetBookingRequest request,
    String? lang,
  }) async {
    final OrderDto response = await _apiCallWrapper.call(
      () => _provider.bookPrivateJet(lang: lang, body: request.toDto),
    );
    return response.toModel;
  }
}
