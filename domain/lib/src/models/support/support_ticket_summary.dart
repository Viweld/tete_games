part of 'support.dart';

@immutable
class SupportTicketSummary {
  final String id;
  final TicketCategoryType category;
  final TicketStatusType status;
  final String? refNumber;
  final DateTime createdAt;
  final String lastMessage;

  const SupportTicketSummary({
    required this.id,
    required this.category,
    required this.status,
    required this.createdAt,
    required this.lastMessage,
    this.refNumber,
  });
}
