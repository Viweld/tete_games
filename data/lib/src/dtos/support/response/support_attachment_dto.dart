part of '../support_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class SupportAttachmentDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'file')
  final String file;

  @JsonKey(name: 'file_url')
  final String fileUrl;

  const SupportAttachmentDto({required this.id, required this.file, required this.fileUrl});

  factory SupportAttachmentDto.fromJson(Map<String, dynamic> json) =>
      _$SupportAttachmentDtoFromJson(json);
}
