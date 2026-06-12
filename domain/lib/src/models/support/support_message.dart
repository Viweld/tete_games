part of 'support.dart';

@immutable
class SupportMessage {
  final int id;
  final String? text;
  final DateTime createdAt;
  final bool isMe;
  final bool isStaffReply;
  final String? senderName;
  final String? senderAvatar;
  final List<SupportAttachment> attachments;
  final BotMessageType? botMessageType;
  final TicketCategoryType? categoryType;

  const SupportMessage({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.isMe,
    required this.isStaffReply,
    required this.attachments,
    this.senderName,
    this.senderAvatar,
    this.botMessageType,
    this.categoryType,
  });

  factory SupportMessage.user({
    required String text,
    required DateTime createdAt,
    List<SupportAttachment> attachments = const <SupportAttachment>[],
    TicketCategoryType? categoryType,
  }) {
    return SupportMessage(
      id: createdAt.microsecondsSinceEpoch,
      text: text,
      createdAt: createdAt,
      isMe: true,
      isStaffReply: false,
      attachments: attachments,
      categoryType: categoryType,
    );
  }

  factory SupportMessage.bot({required BotMessageType type, required DateTime createdAt}) {
    return SupportMessage(
      id: -createdAt.microsecondsSinceEpoch,
      text: null,
      createdAt: createdAt,
      isMe: false,
      isStaffReply: true,
      attachments: const <SupportAttachment>[],
      botMessageType: type,
    );
  }
}

// factory SupportMessage.category({
//   required String text,
//   required TicketCategoryType type,
//   required DateTime createdAt,
// }) {
//   return SupportMessage(
//     id: createdAt.microsecondsSinceEpoch,
//     text: text,
//     createdAt: createdAt,
//     isMe: true,
//     isStaffReply: false,
//     attachments: const <SupportAttachment>[],
//     categoryType: type,
//   );
// }
