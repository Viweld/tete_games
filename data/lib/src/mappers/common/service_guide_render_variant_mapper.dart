part of 'common_mappers.dart';

ServiceGuideRenderVariant parseServiceGuideRenderVariant(String? value) {
  return switch (value) {
    'checklist' => ServiceGuideRenderVariant.checklist,
    'text' => ServiceGuideRenderVariant.text,
    'numbered' => ServiceGuideRenderVariant.numbered,
    'negative_checklist' => ServiceGuideRenderVariant.negativeChecklist,
    'note' => ServiceGuideRenderVariant.note,
    _ => ServiceGuideRenderVariant.unknown,
  };
}
