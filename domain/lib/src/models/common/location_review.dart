import 'package:flutter/foundation.dart';

@immutable
class LocationReview {
  final int id;
  final String nickname;
  final String text;
  final String region;
  final double? rating;
  final String? categorySlug;
  final String? categoryName;
  final DateTime? createdAt;

  const LocationReview({
    required this.id,
    required this.nickname,
    required this.text,
    required this.region,
    this.rating,
    this.categorySlug,
    this.categoryName,
    this.createdAt,
  });
}
