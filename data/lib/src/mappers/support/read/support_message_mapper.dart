part of '../support_mappers.dart';

extension SupportMessageDtoMapper on SupportMessageDto {
  SupportMessage get toModel => SupportMessage(
    id: id,
    text: text,
    createdAt: createdAt,
    isMe: isMe,
    isStaffReply: isStaffReply,
    senderName: senderName,
    senderAvatar: senderAvatar,
    attachments: attachments
        .map(
          (SupportAttachmentDto a) =>
              SupportAttachment(id: a.id, fileName: a.file, fileUrl: a.fileUrl),
        )
        .toList(growable: false),
  );
}
