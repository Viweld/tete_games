part of 'repositories.dart';

abstract interface class PrivateJetsOrderingRepository {
  /// Submits a private jet booking request (no online checkout).
  Future<OrderDraft> bookPrivateJet({required PrivateJetBookingRequest request, String? lang});
}
