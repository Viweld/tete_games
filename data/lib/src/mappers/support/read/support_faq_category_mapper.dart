part of '../support_mappers.dart';

extension SupportFaqCategoryDtoMapper on SupportFaqCategoryDto {
  FaqCategory get toModel => FaqCategory(
    id: id,
    name: name,
    slug: slug,
    items: items
        .map((SupportFaqItemDto i) => FaqItem(id: i.id, question: i.question, answer: i.answer))
        .toList(growable: false),
  );
}
