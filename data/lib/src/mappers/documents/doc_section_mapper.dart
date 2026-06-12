import 'package:data/src/dtos/documents/documents_dtos.dart';
import 'package:domain/domain.dart';

extension DocSectionMapper on DocSectionDto {
  DocSection get toModel => DocSection(title: title, content: content, anchorId: anchorId);
}
