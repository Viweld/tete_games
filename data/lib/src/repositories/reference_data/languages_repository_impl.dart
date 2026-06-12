part of '../repositories.dart';

@LazySingleton(as: LanguagesRepository)
class LanguagesRepositoryImpl implements LanguagesRepository {
  final ReferenceDataApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;

  LanguagesRepositoryImpl(this._provider, this._apiCallWrapper);

  @override
  Future<List<Language>> getLanguages() async {
    final ApiResponse<List<LanguageDto>> response = await _apiCallWrapper.call(
      _provider.getLanguages,
    );
    return response.data.map((LanguageDto dto) => dto.toModel).toList();
  }
}
