part of 'contacts_dtos.dart';

@JsonSerializable(createToJson: false)
class ContactSettingsDto {
  const ContactSettingsDto({this.contactHtml});

  final String? contactHtml;

  factory ContactSettingsDto.fromJson(Map<String, dynamic> json) =>
      _$ContactSettingsDtoFromJson(json);
}
