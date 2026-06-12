part of 'notifications_mappers.dart';

extension FirebaseTokenUpdateResponseDtoMapper on FirebaseTokenUpdateResponseDto {
  FirebaseTokenUpdateResult get toModel =>
      FirebaseTokenUpdateResult(success: success, tokenId: tokenId, isActive: isActive);
}
