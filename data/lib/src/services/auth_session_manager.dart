import 'package:core/core.dart';
import 'package:data/src/dtos/auth/auth_dtos.dart';
import 'package:data/src/providers/api/auth/auth_api_provider.dart';
import 'package:data/src/providers/secure/secure_providers.dart';
import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

/// Keys for storing tokens in secure storage.
abstract class SecureStorageKeys {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
}

/// Manages authentication session including token storage, refresh, and state.
///
/// This class is responsible for:
/// - Initializing auth state on app startup
/// - Storing and retrieving tokens from secure storage
/// - Refreshing tokens when they expire
/// - Managing auth state stream
@lazySingleton
class AuthSessionManager {
  AuthSessionManager({
    required SecureDataProvider secureDataProvider,
    required AuthApiProvider authApiProvider,
  }) : _secureDataProvider = secureDataProvider,
       _authApiProvider = authApiProvider,
       _authStateController = StreamController<AuthenticationState>.broadcast();

  final SecureDataProvider _secureDataProvider;
  final AuthApiProvider _authApiProvider;
  final StreamController<AuthenticationState> _authStateController;

  /// Maximum number of retries for token refresh.
  static const int maxRefreshRetries = 3;

  /// Current cached access token.
  String? _accessToken;

  /// Current authentication state.
  AuthenticationState _authState = const NotAuthenticated();

  /// Set on login when API returns `is_new_user: true`; cleared by consume or logout.
  bool _pendingNewUserWelcome = false;

  /// Gets the current access token.
  String? get accessToken => _accessToken;

  /// Gets the current authentication state.
  AuthenticationState get authState => _authState;

  /// Stream of authentication state changes.
  Stream<AuthenticationState> get authStateStream => _authStateController.stream;

  /// Initializes the authentication session.
  ///
  /// Checks for stored tokens and attempts to refresh if a refresh token exists.
  /// Returns the resulting [AuthenticationState].
  Future<AuthenticationState> initialize() async {
    final String? storedAccessToken = await _secureDataProvider.getValue(
      key: SecureStorageKeys.accessToken,
    );
    final String? storedRefreshToken = await _secureDataProvider.getValue(
      key: SecureStorageKeys.refreshToken,
    );

    if (storedRefreshToken == null || storedRefreshToken.isEmpty) {
      _updateAuthState(const NotAuthenticated());
      return _authState;
    }

    if (storedAccessToken != null && storedAccessToken.isNotEmpty) {
      _accessToken = storedAccessToken;
      _updateAuthState(const Authenticated(isNewUser: false));
    } else {
      // If we only have a refresh token, we must refresh
      final bool refreshed = await refreshTokensWithRetry();

      if (refreshed) {
        _updateAuthState(const Authenticated(isNewUser: false));
      } else {
        await _clearTokens();
        _updateAuthState(const NotAuthenticated());
      }
    }

    return _authState;
  }

  /// Called when login is successful with new tokens.
  ///
  /// Saves tokens to secure storage and updates auth state.
  Future<void> onLoginSuccess({
    required String accessToken,
    required String refreshToken,
    required bool isNewUser,
  }) async {
    await _saveTokens(accessToken: accessToken, refreshToken: refreshToken);
    if (isNewUser) _pendingNewUserWelcome = true;
    _updateAuthState(Authenticated(isNewUser: isNewUser));
  }

  /// Returns true once after a new-user login, then clears the flag.
  bool consumePendingNewUserWelcome() {
    if (!_pendingNewUserWelcome) return false;
    _pendingNewUserWelcome = false;
    return true;
  }

  /// Attempts to refresh tokens, with retry logic.
  ///
  /// Returns `true` if refresh was successful, `false` otherwise.
  Future<bool> refreshTokensWithRetry() async {
    for (int attempt = 0; attempt < maxRefreshRetries; attempt++) {
      final bool success = await _refreshTokensOnce();
      if (success) return true;
      await Future<void>.delayed(const Duration(milliseconds: 500));
    }
    return false;
  }

  /// Single attempt to refresh tokens.
  Future<bool> _refreshTokensOnce() async {
    try {
      final String? storedRefreshToken = await _secureDataProvider.getValue(
        key: SecureStorageKeys.refreshToken,
      );

      if (storedRefreshToken == null || storedRefreshToken.isEmpty) return false;

      final TokensResponseDto response = await _authApiProvider.refreshTokens(<String, dynamic>{
        'refresh': storedRefreshToken,
      });

      await _saveTokens(accessToken: response.accessToken, refreshToken: response.refreshToken);

      return true;
    } on DioException catch (e) {
      final int? statusCode = e.response?.statusCode;
      if (statusCode == 401) {
        await _clearTokens();
        _updateAuthState(const NotAuthenticated());
        return false;
      }
      return false;
    } on Object {
      return false;
    }
  }

  /// Logs out the user by clearing tokens and updating state.
  Future<void> logout() async {
    _pendingNewUserWelcome = false;
    await _clearTokens();
    _updateAuthState(const NotAuthenticated());
  }

  /// Saves tokens to secure storage and memory.
  Future<void> _saveTokens({required String accessToken, required String refreshToken}) async {
    _accessToken = accessToken;
    await _secureDataProvider.setValue(key: SecureStorageKeys.accessToken, value: accessToken);
    await _secureDataProvider.setValue(key: SecureStorageKeys.refreshToken, value: refreshToken);
  }

  /// Clears tokens from secure storage and memory.
  Future<void> _clearTokens() async {
    _accessToken = null;
    await _secureDataProvider.deleteValue(key: SecureStorageKeys.accessToken);
    await _secureDataProvider.deleteValue(key: SecureStorageKeys.refreshToken);
  }

  /// Updates auth state and notifies listeners.
  void _updateAuthState(AuthenticationState state) {
    _authState = state;
    _authStateController.add(state);
  }

  /// Closes the auth state stream controller.
  Future<void> close() async {
    await _authStateController.close();
  }
}
