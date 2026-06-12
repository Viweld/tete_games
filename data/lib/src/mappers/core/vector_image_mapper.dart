import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:domain/domain.dart';

extension VectorImageDtoMapper on VectorImageDto {
  VectorImage? get toModel {
    if (original == null || large == null || medium == null || small == null) {
      return null;
    }

    return VectorImage(original: original!, large: large!, medium: medium!, small: small!);
  }
}
