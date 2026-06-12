part of '../repositories.dart';

@LazySingleton(as: TransfersTypesRepository)
class TransfersTypesRepositoryImpl implements TransfersTypesRepository {
  final ServicesApiProvider _servicesApiProvider;
  final ApiCallWrapper _apiCallWrapper;

  TransfersTypesRepositoryImpl(this._servicesApiProvider, this._apiCallWrapper);

  @override
  Future<List<Service>> getTransferTypes() async {
    final String json = await _apiCallWrapper.call(
      () => _servicesApiProvider.getServicesRaw(scope: 'global'),
    );

    return parseServiceListFromJsonInIsolate(json);
  }
}
