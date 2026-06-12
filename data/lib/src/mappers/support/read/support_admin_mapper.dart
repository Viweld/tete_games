part of '../support_mappers.dart';

extension SupportAdminDtoMapper on SupportAdminDto {
  SupportAdmin get toModel => SupportAdmin(
    id: id,
    fullName: fullName,
    email: email,
    firstName: firstName,
    lastName: lastName,
    avatar: avatar,
    bitrixUserId: bitrixUserId,
  );
}
