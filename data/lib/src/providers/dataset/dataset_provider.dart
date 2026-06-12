import 'dart:convert';

import 'package:data/src/dtos/core/api_core_dtos.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DatasetProvider {
  Future<ApiResponse<T>> fetchData<T>({
    required String datasetPath,
    required T Function(Object? json) fromJsonT,
  }) async {
    final String jsonString = await rootBundle.loadString(datasetPath);
    final Map<String, dynamic> jsonData = json.decode(jsonString) as Map<String, dynamic>;

    return ApiResponse<T>.fromJson(jsonData, fromJsonT);
  }
}
