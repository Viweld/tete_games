import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ServiceImagesConverter implements JsonConverter<List<PhotoDto>?, dynamic> {
  const ServiceImagesConverter();

  @override
  List<PhotoDto>? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }

    if (json is List) {
      return json.map((dynamic e) => PhotoDto.fromJson(e as Map<String, dynamic>)).toList();
    }

    if (json is Map<String, dynamic>) {
      return <PhotoDto>[PhotoDto.fromJson(json)];
    }

    return null;
  }

  @override
  Object? toJson(List<PhotoDto>? object) => throw UnimplementedError();
}
