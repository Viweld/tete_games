part of '../support_mappers.dart';

extension SupportTicketListDtoMapper on SupportTicketListDto {
  SupportTicketSummary get toModel => SupportTicketSummary(
    id: id,
    category: mapTicketCategoryFromApi(category),
    status: mapTicketStatusFromApi(status),
    createdAt: createdAt,
    lastMessage: lastMessage,
    refNumber: refNumber,
  );
}
