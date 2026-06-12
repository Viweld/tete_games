part of '../support_mappers.dart';

extension SupportTicketDetailDtoMapper on SupportTicketDetailDto {
  SupportTicket get toModel => SupportTicket(
    id: id,
    category: mapTicketCategoryFromApi(category),
    status: mapTicketStatusFromApi(status),
    contactEmail: contactEmail,
    createdAt: createdAt,
    assignedAdmin: assignedAdmin?.toModel,
    replyAsAdmin: replyAsAdmin?.toModel,
    refNumber: refNumber,
    messages: messages.map((SupportMessageDto dto) => dto.toModel).toList(growable: false),
  );
}
