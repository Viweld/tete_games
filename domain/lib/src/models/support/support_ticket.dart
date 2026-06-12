part of 'support.dart';

@immutable
class SupportTicket {
  final String id;
  final TicketCategoryType category;
  final TicketStatusType status;
  final String? refNumber;
  final String contactEmail;
  final DateTime createdAt;
  final SupportAdmin? assignedAdmin;
  final SupportAdmin? replyAsAdmin;
  final List<SupportMessage> messages;

  const SupportTicket({
    required this.id,
    required this.category,
    required this.status,
    required this.contactEmail,
    required this.createdAt,
    required this.messages,
    this.refNumber,
    this.assignedAdmin,
    this.replyAsAdmin,
  });
}
