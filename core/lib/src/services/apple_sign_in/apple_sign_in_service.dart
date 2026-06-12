import 'package:core/core.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract final class AppleSignInService {
  static Future<AppleSignInModel?> signInNative() async {
    try {
      final AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
        scopes: <AppleIDAuthorizationScopes>[
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      final String? identityToken = credential.identityToken;
      if (identityToken == null) throw Exception('Failed to get Apple identity token');

      // Apple may return fullName only on the very first authorization.
      final String firstName = credential.givenName ?? '-';
      final String lastName = credential.familyName ?? '-';

      return AppleSignInModel(
        token: identityToken,
        firstName: firstName,
        lastName: lastName,
        clientId: AppConstants.appleSignInClientId,
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) return null;
      rethrow;
    }
  }

  /// Web-flow sign-in used on Android (Custom Tabs).
  static Future<AppleSignInModel?> signInWebFlow() async {
    try {
      final String? redirectUriRaw = dotenv.env['APPLE_WEB_REDIRECT_URI'];
      if (redirectUriRaw == null || redirectUriRaw.isEmpty) {
        throw Exception('Missing APPLE_WEB_REDIRECT_URI env var for Apple web-flow');
      }

      final AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
        scopes: <AppleIDAuthorizationScopes>[
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        webAuthenticationOptions: WebAuthenticationOptions(
          clientId: AppConstants.appleSignInWebClientId,
          redirectUri: Uri.parse(redirectUriRaw),
        ),
      );

      final String? identityToken = credential.identityToken;
      if (identityToken == null || identityToken.isEmpty) {
        throw Exception('Failed to get Apple identity token (web-flow)');
      }
      final String firstName = credential.givenName ?? '-';
      final String lastName = credential.familyName ?? '-';

      return AppleSignInModel(
        token: identityToken,
        firstName: firstName,
        lastName: lastName,
        clientId: AppConstants.appleSignInWebClientId,
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) return null;
      rethrow;
    }
  }
}
