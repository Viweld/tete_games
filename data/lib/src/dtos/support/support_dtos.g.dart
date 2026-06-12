// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportAdminDto _$SupportAdminDtoFromJson(Map<String, dynamic> json) =>
    SupportAdminDto(
      id: (json['id'] as num).toInt(),
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      fullName: json['full_name'] as String,
      avatar: json['avatar'] as String?,
      bitrixUserId: (json['bitrix_user_id'] as num?)?.toInt(),
    );

SupportAttachmentDto _$SupportAttachmentDtoFromJson(
  Map<String, dynamic> json,
) => SupportAttachmentDto(
  id: (json['id'] as num).toInt(),
  file: json['file'] as String,
  fileUrl: json['file_url'] as String,
);

SupportFaqCategoryDto _$SupportFaqCategoryDtoFromJson(
  Map<String, dynamic> json,
) => SupportFaqCategoryDto(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  slug: json['slug'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => SupportFaqItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

SupportFaqItemDto _$SupportFaqItemDtoFromJson(Map<String, dynamic> json) =>
    SupportFaqItemDto(
      id: (json['id'] as num).toInt(),
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

SupportMessageDto _$SupportMessageDtoFromJson(Map<String, dynamic> json) =>
    SupportMessageDto(
      id: (json['id'] as num).toInt(),
      text: json['text'] as String?,
      attachments: (json['attachments'] as List<dynamic>)
          .map((e) => SupportAttachmentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
      senderName: json['sender_name'] as String?,
      senderAvatar: json['sender_avatar'] as String?,
      isStaffReply: json['is_staff_reply'] as bool,
      isMe: json['is_me'] as bool,
    );

SupportTicketDetailDto _$SupportTicketDetailDtoFromJson(
  Map<String, dynamic> json,
) => SupportTicketDetailDto(
  id: json['id'] as String,
  category: json['category'] as String,
  status: json['status'] as String,
  contactEmail: json['contact_email'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  messages: (json['messages'] as List<dynamic>)
      .map((e) => SupportMessageDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  refNumber: json['ref_number'] as String?,
  assignedAdmin: json['assigned_admin'] == null
      ? null
      : SupportAdminDto.fromJson(
          json['assigned_admin'] as Map<String, dynamic>,
        ),
  replyAsAdmin: json['reply_as_admin'] == null
      ? null
      : SupportAdminDto.fromJson(
          json['reply_as_admin'] as Map<String, dynamic>,
        ),
);

SupportTicketListDto _$SupportTicketListDtoFromJson(
  Map<String, dynamic> json,
) => SupportTicketListDto(
  id: json['id'] as String,
  category: json['category'] as String,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  lastMessage: json['last_message'] as String,
  refNumber: json['ref_number'] as String?,
);

Map<String, dynamic> _$CreateSupportTicketRequestDtoToJson(
  CreateSupportTicketRequestDto instance,
) => <String, dynamic>{
  'category': instance.category,
  'ref_number': instance.refNumber,
  'contact_email': instance.contactEmail,
  'message': instance.message,
};
