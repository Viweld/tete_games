import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:domain/domain.dart';

extension PhotoDtoMapper on PhotoDto {
  Photo? get toModel {
    if (original == null || large == null || medium == null || small == null) {
      return null;
    }

    return Photo(original: original!, large: large!, medium: medium!, small: small!);
  }
}
