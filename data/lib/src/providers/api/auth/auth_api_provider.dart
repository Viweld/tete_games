import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/auth/auth_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_provider.g.dart';

/// Retrofit provider for authentication API endpoints.
/// Handles sending verification codes, verifying codes, and refreshing tokens.
///
/// Uses a separate Dio instance without AuthInterceptor to avoid
/// circular dependency.
@RestApi()
@injectable
abstract class AuthApiProvider {
  @factoryMethod
  factory AuthApiProvider(@Named('AuthDio') Dio dio) = _AuthApiProvider;

  /// Sends a verification code to the specified email address.
  @POST('${ApiProvidersVersions.authApiVersion}/users/auth/email/request/')
  Future<void> sendCodeToEmail(@Body() Map<String, dynamic> body);

  /// Verifies the code sent to the email and returns tokens on success.
  @POST('${ApiProvidersVersions.authApiVersion}/users/auth/email/verify/')
  Future<AuthVerifyResponseDto> verifyCode(@Body() Map<String, dynamic> body);

  /// Refreshes the access token using the refresh token.
  @POST('${ApiProvidersVersions.authApiVersion}/users/auth/refresh/')
  Future<TokensResponseDto> refreshTokens(@Body() Map<String, dynamic> body);

  /// Signs in using Google ID token and returns session tokens.
  @POST('${ApiProvidersVersions.authApiVersion}/users/auth/social/google/verify/')
  Future<AuthVerifyResponseDto> signInWithGoogleToken(@Body() Map<String, dynamic> body);

  /// Signs in using Apple identity token and returns session tokens.
  @POST('${ApiProvidersVersions.authApiVersion}/users/auth/social/apple/')
  Future<AuthVerifyResponseDto> signInWithApple(@Body() Map<String, dynamic> body);
}
