part of '../support_dtos.dart';

@JsonSerializable(createToJson: false)
class SupportFaqItemDto {
  final int id;
  final String question;
  final String answer;

  const SupportFaqItemDto({required this.id, required this.question, required this.answer});

  factory SupportFaqItemDto.fromJson(Map<String, dynamic> json) =>
      _$SupportFaqItemDtoFromJson(json);
}
