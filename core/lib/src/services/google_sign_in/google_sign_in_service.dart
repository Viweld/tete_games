import 'package:core/core.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract final class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  static bool _initialized = false;

  static Future<void> _init() async {
    try {
      if (_initialized) return;

      final String? webClientId = dotenv.env['WEB_CLIENT_ID'];
      final String? iosClientId = dotenv.env['IOS_CLIENT_ID'];

      await _googleSignIn.initialize(
        clientId: Platform.isIOS ? iosClientId : null,
        serverClientId: webClientId,
      );

      _initialized = true;
    } on Object {
      // Init failure is ignored; authenticate() may still succeed.
    }
  }

  static Future<GoogleSignInModel?> signIn() async {
    try {
      await _init();

      final GoogleSignInAccount googleAccount = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleAccount.authentication;
      final String? idToken = googleAuth.idToken;

      if (idToken == null) throw Exception('Failed to get Google ID token');

      final String fullName = googleAccount.displayName ?? '';
      final List<String> parts = fullName
          .trim()
          .split(' ')
          .where((String e) => e.isNotEmpty)
          .toList();

      return GoogleSignInModel(
        token: idToken,
        firstName: parts.isNotEmpty ? parts.first : '',
        lastName: parts.length > 1 ? parts.sublist(1).join(' ') : '',
      );
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) return null;
      rethrow;
    }
  }
}
