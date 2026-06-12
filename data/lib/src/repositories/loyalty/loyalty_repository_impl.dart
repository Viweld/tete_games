part of '../repositories.dart';

@LazySingleton(as: LoyaltyRepository)
class LoyaltyRepositoryImpl implements LoyaltyRepository {
  final LoyaltyApiProvider _apiProvider;
  final ApiCallWrapper _apiCallWrapper;

  LoyaltyRepositoryImpl({
    required LoyaltyApiProvider apiProvider,
    required ApiCallWrapper apiCallWrapper,
  }) : _apiProvider = apiProvider,
       _apiCallWrapper = apiCallWrapper;

  @override
  Future<LoyaltyProgramOverview> getAuthorizedLoyaltyProgramOverview() async {
    final ApiResponse<LoyaltyProgramOverviewDto> response = await _apiCallWrapper.call(
      _apiProvider.getAuthorizedLoyaltyProgramOverview,
    );
    return response.data.toModel;
  }

  @override
  Future<List<LoyaltyLevel>> getPublicLoyaltyLevels() async {
    final ApiResponse<List<LoyaltyLevelDto>> response = await _apiCallWrapper.call(
      _apiProvider.getPublicLoyaltyLevels,
    );
    return response.data.map((LoyaltyLevelDto e) => e.toModel).toList();
  }
}
