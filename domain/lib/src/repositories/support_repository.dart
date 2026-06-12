part of 'repositories.dart';

abstract interface class SupportRepository {
  Future<List<FaqCategory>> getFaqList({String? airport, String? category});

  Future<List<SupportTicketSummary>> getTickets();

  Future<SupportTicket> getTicket({required String id});

  Future<SupportTicket> createTicket({
    TicketCategoryType? category,
    String? refNumber,
    String? contactEmail,
    required String message,
  });

  Future<void> cancelTicket(String id);

  Future<SupportMessage> sendMessage({
    required String id,
    String? text,
    List<String>? attachmentFilePaths,
  });
}
