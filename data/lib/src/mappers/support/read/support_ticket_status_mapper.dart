part of '../support_mappers.dart';

TicketStatusType mapTicketStatusFromApi(String value) => switch (value) {
  'open' => TicketStatusType.open,
  'in_progress' => TicketStatusType.inProgress,
  'waiting_client' => TicketStatusType.waitingClient,
  'closed' => TicketStatusType.closed,
  _ => TicketStatusType.open,
};
