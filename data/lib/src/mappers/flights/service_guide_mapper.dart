import 'package:data/src/dtos/dtos.dart';
import 'package:data/src/mappers/common/common_mappers.dart';
import 'package:domain/domain.dart';

extension ServiceGuideDtoMapper on ServiceGuideDto {
  ServiceGuide get toModel => ServiceGuide(
    title: title ?? '',
    description: description ?? '',
    color: color,
    ordering: ordering ?? 0,
    renderVariant: parseServiceGuideRenderVariant(renderVariant),
    isMain: isMain ?? false,
  );
}
