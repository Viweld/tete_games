import 'package:core/core.dart';
import 'package:data/src/constance/api_providers_versions.dart';
import 'package:data/src/dtos/notifications/notifications_dtos.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'notifications_api_provider.g.dart';

@RestApi()
@injectable
abstract class NotificationsApiProvider {
  @factoryMethod
  factory NotificationsApiProvider(Dio dio) = _NotificationsApiProvider;

  @GET('${ApiProvidersVersions.apiVersion}/notifications/')
  Future<List<UserNotificationDto>> getNotifications({
    @Query('category') String? category,
    @Query('is_read') bool? isRead,
    @Query('kind') String? kind,
    @Query('lang') String? lang,
  });

  @POST('${ApiProvidersVersions.apiVersion}/notifications/firebase-token/')
  Future<FirebaseTokenUpdateResponseDto> upsertFirebaseToken({
    @Query('lang') String? lang,
    @Body() required FirebaseTokenUpdateRequestDto body,
  });

  @POST('${ApiProvidersVersions.apiVersion}/notifications/mark-read/')
  Future<MarkReadResponseDto> markNotificationsRead({
    @Query('lang') String? lang,
    @Body() required MarkNotificationReadRequestDto body,
  });

  @POST('${ApiProvidersVersions.apiVersion}/notifications/mark-read/')
  Future<MarkReadResponseDto> markNotificationsReadAll({
    @Query('lang') String? lang,
    @Body() required MarkNotificationReadAllRequestDto body,
  });

  @GET('${ApiProvidersVersions.apiVersion}/notifications/unread-indicator/')
  Future<UnreadIndicatorDto> getUnreadIndicator({@Query('lang') String? lang});
}
