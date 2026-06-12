part of 'repositories.dart';

abstract interface class AuthRepository {
  /// Current authentication state
  AuthenticationState get authState;

  /// Stream of authentication state changes
  Stream<AuthenticationState> get authStateStream;

  /// The last email address for which a verification code was requested.
  /// Used for checking the code and timer logic.
  String? get lastRequestedEmail;

  /// Initializes the authentication session.
  /// Checks for stored tokens and attempts to refresh if needed.
  /// Returns the resulting [AuthenticationState].
  Future<AuthenticationState> initialize();

  /// Requests a verification code to be sent to the specified email
  Future<void> requestCodeToEmail({required String email});

  /// Checks if the provided code matches the one sent to [lastRequestedEmail].
  /// Returns AuthState.authenticated if login was successful.
  Future<AuthenticationState> checkCode({required String code});

  /// Logs out the user by clearing tokens and session.
  Future<void> logout();

  /// Signs in using Google account.
  Future<AuthenticationState> signInWithGoogle({
    required String token,
    required String firstName,
    required String lastName,
  });

  /// Signs in using Apple account (mobile: identity token).
  Future<AuthenticationState> signInWithApple({
    required String token,
    required String clientId,
    required String firstName,
    required String lastName,
  });

  /// Returns true once after a new-user login, then clears the pending welcome flag.
  bool consumePendingNewUserWelcome();

  /// Closes resources used by the repository.
  Future<void> close();
}
