import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:json_annotation/json_annotation.dart';

/// Loyalty level `image` may be a photo object, a single URI string, or null.
class LoyaltyLevelImageConverter implements JsonConverter<PhotoDto?, dynamic> {
  const LoyaltyLevelImageConverter();

  @override
  PhotoDto? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    if (json is String) {
      return PhotoDto(original: json, large: json, medium: json, small: json);
    }
    if (json is Map<String, dynamic>) {
      return PhotoDto.fromJson(json);
    }
    return null;
  }

  @override
  Object? toJson(PhotoDto? object) => throw UnimplementedError();
}
