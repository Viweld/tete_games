part of '../repositories.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final AuthSessionManager _authSessionManager;
  final AuthApiProvider _authApiProvider;
  final ApiCallWrapper _apiCallWrapper;
  String? _lastRequestedEmail;

  AuthRepositoryImpl({
    required AuthSessionManager authSessionManager,
    required AuthApiProvider authApiProvider,
    required ApiCallWrapper apiCallWrapper,
  }) : _authSessionManager = authSessionManager,
       _authApiProvider = authApiProvider,
       _apiCallWrapper = apiCallWrapper;

  @override
  String? get lastRequestedEmail => _lastRequestedEmail;

  @override
  AuthenticationState get authState => _authSessionManager.authState;

  @override
  Stream<AuthenticationState> get authStateStream => _authSessionManager.authStateStream;

  @override
  Future<AuthenticationState> initialize() => _authSessionManager.initialize();

  @override
  Future<void> requestCodeToEmail({required String email}) async {
    await _apiCallWrapper.call(
      () => _authApiProvider.sendCodeToEmail(<String, dynamic>{'email': email}),
    );
    _lastRequestedEmail = email;
  }

  @override
  Future<AuthenticationState> checkCode({required String code}) async {
    final String? email = _lastRequestedEmail;
    if (email == null) throw Exception('Email was not requested');

    try {
      final AuthVerifyResponseDto response = await _apiCallWrapper.call(
        () => _authApiProvider.verifyCode(<String, dynamic>{'email': email, 'code': code}),
      );

      await _authSessionManager.onLoginSuccess(
        accessToken: response.tokens.accessToken,
        refreshToken: response.tokens.refreshToken,
        isNewUser: response.isNewUser,
      );

      return Authenticated(isNewUser: response.isNewUser);
    } on OtherException catch (e) {
      if (e.statusCode == 400) throw InvalidCodeException(msg: e.userMessage);
      rethrow;
    }
  }

  @override
  Future<void> logout() => _authSessionManager.logout();

  @override
  Future<AuthenticationState> signInWithGoogle({
    required String token,
    required String firstName,
    required String lastName,
  }) async {
    final AuthVerifyResponseDto response = await _apiCallWrapper.call(
      () => _authApiProvider.signInWithGoogleToken(<String, dynamic>{
        'token': token,
        'firstName': firstName,
        'lastName': lastName,
      }),
    );

    await _authSessionManager.onLoginSuccess(
      accessToken: response.tokens.accessToken,
      refreshToken: response.tokens.refreshToken,
      isNewUser: response.isNewUser,
    );

    return Authenticated(isNewUser: response.isNewUser);
  }

  @override
  Future<AuthenticationState> signInWithApple({
    required String token,
    required String clientId,
    required String firstName,
    required String lastName,
  }) async {
    final AuthVerifyResponseDto response = await _apiCallWrapper.call(
      () => _authApiProvider.signInWithApple(<String, dynamic>{
        'token': token,
        'clientId': clientId,
        'firstName': firstName,
        'lastName': lastName,
      }),
    );

    await _authSessionManager.onLoginSuccess(
      accessToken: response.tokens.accessToken,
      refreshToken: response.tokens.refreshToken,
      isNewUser: response.isNewUser,
    );

    return Authenticated(isNewUser: response.isNewUser);
  }

  @override
  bool consumePendingNewUserWelcome() => _authSessionManager.consumePendingNewUserWelcome();

  @override
  Future<void> close() => _authSessionManager.close();
}
