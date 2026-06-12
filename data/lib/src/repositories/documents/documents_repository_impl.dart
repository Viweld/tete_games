part of '../repositories.dart';

@LazySingleton(as: DocumentsRepository)
class DocumentsRepositoryImpl implements DocumentsRepository {
  final DocumentsApiProvider _documentsProvider;
  final ApiCallWrapper _apiCallWrapper;

  const DocumentsRepositoryImpl(this._documentsProvider, this._apiCallWrapper);

  @override
  Future<List<DocPage>> getDocuments({String? lang}) async {
    final List<DocPageDto> response = await _apiCallWrapper.call(
      () => _documentsProvider.getDocuments(lang: lang),
    );
    return response.map((DocPageDto e) => e.toModel).toList();
  }

  @override
  Future<DocPage> getDocDetails(String slug, {String? lang}) async {
    final DocPageDto response = await _apiCallWrapper.call(
      () => _documentsProvider.getDocDetails(slug, lang: lang),
    );
    return response.toModel;
  }
}
