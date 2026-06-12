part of '../repositories.dart';

@LazySingleton(as: PrivateJetsRepository)
class PrivateJetsRepositoryImpl implements PrivateJetsRepository {
  final ServicesApiProvider _servicesApiProvider;
  final ApiCallWrapper _apiCallWrapper;

  PrivateJetsRepositoryImpl(this._servicesApiProvider, this._apiCallWrapper);

  @override
  Future<PrivateJetsCatalog> getPrivateJets({String? iataCode, int? page, int? limit}) async {
    final PrivateJetsCatalogDto response = await _apiCallWrapper.call(
      () => _servicesApiProvider.getPrivateJets(iataCode: iataCode, page: page, limit: limit),
    );

    return response.toModel;
  }
}
