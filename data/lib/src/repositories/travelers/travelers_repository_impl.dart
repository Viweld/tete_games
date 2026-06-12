part of '../repositories.dart';

@LazySingleton(as: TravelersRepository)
class TravelersRepositoryImpl implements TravelersRepository {
  final TravelersApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  TravelersRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<List<Traveler>> getTravelers() async {
    final List<TravelerDto> response = await _apiCallWrapper.call(_provider.getTravelers);
    return response.map((TravelerDto e) => e.toModel).toList();
  }

  @override
  Future<Traveler> createTraveler({required CreateTravelerRequest request}) async {
    final TravelerDto response = await _apiCallWrapper.call(
      () => _provider.createTravelers(body: request.toDto.toJson()),
    );
    return response.toModel;
  }

  @override
  Future<Traveler> getTraveler({required int id}) async {
    final TravelerDto response = await _apiCallWrapper.call(() => _provider.getTraveler(id: id));
    return response.toModel;
  }

  @override
  Future<Traveler> updateTraveler({required int id, required UpdateTravelerRequest request}) async {
    final TravelerDto response = await _apiCallWrapper.call(
      () => _provider.updateTraveler(id: id, body: request.toDto),
    );
    return response.toModel;
  }

  @override
  Future<Traveler> replaceTraveler({
    required int id,
    required CreateTravelerRequest request,
  }) async {
    final TravelerDto response = await _apiCallWrapper.call(
      () => _provider.replaceTraveler(id: id, body: request.toDto.toJson()),
    );
    return response.toModel;
  }

  @override
  Future<void> deleteTraveler({required int id}) async {
    await _apiCallWrapper.call(() => _provider.deleteTraveler(id: id));
  }
}
