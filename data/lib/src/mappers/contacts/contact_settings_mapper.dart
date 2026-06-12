import 'package:data/src/dtos/contacts/contacts_dtos.dart';
import 'package:domain/domain.dart';

extension ContactSettingsMapper on ContactSettingsDto {
  ContactSettings get toModel => ContactSettings(contactHtml: contactHtml);
}
