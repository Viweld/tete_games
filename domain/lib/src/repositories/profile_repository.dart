part of 'repositories.dart';

abstract interface class ProfileRepository {
  UserProfile? get profileData;

  Stream<UserProfile?> get profileStream;

  Future<void> fetchProfileData();

  Future<void> clearProfileData();

  String? get lastRequestedEmail;

  Future<void> requestChangeEmail({required String email});

  Future<void> confirmChangeEmail({required String code});

  Future<void> requestDeleteAccount();

  Future<void> confirmDeleteAccount({required String code});

  Future<void> changeName({required String firstName, required String lastName});

  Future<void> changeAvatar({required File image});

  Future<void> setBirthday({required String formattedDate});

  Future<void> setCitizenship({required int citizenshipId});

  Future<void> setPhone({required String phone});

  Future<void> updateProfileWithOrderingSyncPatch(ProfileOrderingSyncPatch patch);

  Future<void> setGender({required Gender gender});

  Future<void> setLanguage({required String languageCode});

  Future<void> setCurrency({required String currencyCode});

  Future<void> close();
}
