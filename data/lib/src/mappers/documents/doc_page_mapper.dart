import 'package:data/src/dtos/documents/documents_dtos.dart';
import 'package:data/src/mappers/documents/doc_section_mapper.dart';
import 'package:domain/domain.dart';

extension DocPageMapper on DocPageDto {
  DocPage get toModel => DocPage(
    slug: slug,
    title: title,
    introText: introText,
    sections: sections.map((DocSectionDto e) => e.toModel).toList(),
    createdAt: DateTime.parse(createdAt),
    updatedAt: DateTime.parse(updatedAt),
  );
}
