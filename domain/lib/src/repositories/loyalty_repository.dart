part of 'repositories.dart';

abstract class LoyaltyRepository {
  Future<LoyaltyProgramOverview> getAuthorizedLoyaltyProgramOverview();
  Future<List<LoyaltyLevel>> getPublicLoyaltyLevels();
}
