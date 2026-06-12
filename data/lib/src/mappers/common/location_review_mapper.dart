part of 'common_mappers.dart';

extension LocationReviewDtoMapper on LocationReviewDto {
  LocationReview get toModel => LocationReview(
    id: id,
    nickname: nickname ?? '',
    text: text ?? '',
    region: region ?? '',
    rating: parseRatingString(rating),
    categorySlug: categorySlug,
    categoryName: categoryName,
    createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
  );
}
