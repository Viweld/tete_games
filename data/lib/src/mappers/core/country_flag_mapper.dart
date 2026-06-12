import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:domain/domain.dart';

extension CountryFlagDtoMapper on CountryFlagDto {
  CountryFlag? get toModel {
    if (original == null || large == null || medium == null || small == null) {
      return null;
    }

    return CountryFlag(original: original!, large: large!, medium: medium!, small: small!);
  }
}
