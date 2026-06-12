part of '../repositories.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final UserProfileApiProvider _provider;
  final ApiCallWrapper _apiCallWrapper;
  late final StreamController<UserProfile?> _streamController;

  UserProfile? _profileData;
  String? _lastRequestedEmail;

  ProfileRepositoryImpl(this._provider, this._apiCallWrapper) {
    _streamController = StreamController<UserProfile?>.broadcast();
  }

  @override
  UserProfile? get profileData => _profileData;

  @override
  Stream<UserProfile?> get profileStream => _streamController.stream;

  @override
  Future<void> fetchProfileData() async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(_provider.getProfile);

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> clearProfileData() async {
    _profileData = null;

    if (_streamController.isClosed) return;

    _streamController.add(_profileData);
  }

  @override
  String? get lastRequestedEmail => _lastRequestedEmail;

  @override
  Future<void> requestChangeEmail({required String email}) async {
    await _apiCallWrapper.call(
      () => _provider.requestChangeEmail(<String, dynamic>{'new_email': email}),
    );

    _lastRequestedEmail = email;
  }

  @override
  Future<void> confirmChangeEmail({required String code}) async {
    final String? email = _lastRequestedEmail;

    if (email == null) throw Exception('Email was not requested');

    await _apiCallWrapper.call(
      () => _provider.verifyChangeEmail(<String, dynamic>{'new_email': email, 'code': code}),
    );

    await fetchProfileData();
  }

  @override
  Future<void> requestDeleteAccount() async {
    await _apiCallWrapper.call(_provider.requestDeleteAccount);
  }

  @override
  Future<void> confirmDeleteAccount({required String code}) async {
    await _apiCallWrapper.call(
      () => _provider.verifyDeleteAccount(<String, dynamic>{'code': code}),
    );
  }

  @override
  Future<void> changeName({required String firstName, required String lastName}) async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.updateProfile(<String, dynamic>{
        'first_name': firstName,
        'last_name': lastName,
      }),
    );

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> changeAvatar({required File image}) async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.uploadAvatar(image),
    );

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> setBirthday({required String formattedDate}) async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.updateProfile(<String, dynamic>{'date_of_birth': formattedDate}),
    );

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> setCitizenship({required int citizenshipId}) async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.updateProfile(<String, dynamic>{'citizenship_id': citizenshipId}),
    );

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> setPhone({required String phone}) async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.updateProfile(<String, dynamic>{'phone': phone}),
    );

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> updateProfileWithOrderingSyncPatch(ProfileOrderingSyncPatch patch) async {
    final Map<String, dynamic> body = patch.toUpdateProfileBody();
    if (body.isEmpty) {
      return;
    }

    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.updateProfile(body),
    );

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> setGender({required Gender gender}) async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.updateProfile(<String, dynamic>{'gender': gender.toApiString()}),
    );

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> setLanguage({required String languageCode}) async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.updateProfile(<String, dynamic>{'language': languageCode}),
    );

    _updateProfileData(response.data.toModel);
  }

  @override
  Future<void> setCurrency({required String currencyCode}) async {
    final ApiResponse<UserProfileDto> response = await _apiCallWrapper.call(
      () => _provider.updateProfile(<String, dynamic>{'currency': currencyCode}),
    );

    _updateProfileData(response.data.toModel);
  }

  void _updateProfileData(UserProfile profileData) {
    _profileData = profileData;

    if (_streamController.isClosed) return;

    _streamController.add(profileData);
  }

  @override
  Future<void> close() => _streamController.close();
}
