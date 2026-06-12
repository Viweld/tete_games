import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:data/src/dtos/profile/profile_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_profile_api_provider.g.dart';

/// Retrofit provider for user profile API endpoints.
@RestApi()
@injectable
abstract class UserProfileApiProvider {
  @factoryMethod
  factory UserProfileApiProvider(Dio dio) = _UserProfileApiProvider;

  /// Get current user profile.
  @GET('${ApiProvidersVersions.apiVersion}/users/profile/me/')
  Future<ApiResponse<UserProfileDto>> getProfile();

  /// Update current user profile.
  ///* {
  ///*   "first_name": "string",
  ///*   "last_name": "string",
  ///*   "phone": "string",
  ///*   "date_of_birth": "2026-02-09",
  ///*   "gender": "M",
  ///*   "citizenship_id": 0,
  ///*   "language": "en",
  ///*   "currency": "USD",
  ///*   "notification_settings": "string"
  ///* }
  @PATCH('${ApiProvidersVersions.apiVersion}/users/profile/me/')
  Future<ApiResponse<UserProfileDto>> updateProfile(@Body() Map<String, dynamic> body);

  /// Upload user avatar.
  @POST('${ApiProvidersVersions.apiVersion}/users/profile/me/avatar/')
  @MultiPart()
  Future<ApiResponse<UserProfileDto>> uploadAvatar(@Part() File avatar);

  /// Request OTP for account deletion.
  @POST('${ApiProvidersVersions.apiVersion}/users/profile/delete/request/')
  Future<void> requestDeleteAccount();

  /// Verify OTP and delete account.
  @POST('${ApiProvidersVersions.apiVersion}/users/profile/delete/verify/')
  Future<void> verifyDeleteAccount(@Body() Map<String, dynamic> body);

  /// Request OTP for email change.
  @POST('${ApiProvidersVersions.apiVersion}/users/profile/email/change/request/')
  Future<void> requestChangeEmail(@Body() Map<String, dynamic> body);

  /// Verify OTP and update email.
  @POST('${ApiProvidersVersions.apiVersion}/users/profile/email/change/verify/')
  Future<void> verifyChangeEmail(@Body() Map<String, dynamic> body);
}
