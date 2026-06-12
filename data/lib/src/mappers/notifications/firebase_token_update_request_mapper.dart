part of 'notifications_mappers.dart';

extension FirebaseTokenUpdateRequestDtoMapper on FirebaseTokenUpdateRequestDto {
  FirebaseTokenUpdateRequest get toModel =>
      FirebaseTokenUpdateRequest(token: token, platform: platform, appVersion: appVersion);
}
