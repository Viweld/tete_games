import 'package:data/src/dtos/common/common_dtos.dart';
import 'package:data/src/dtos/flights/flights_dtos.dart';
import 'package:data/src/dtos/services/services_dtos.dart';
import 'package:data/src/mappers/common/common_mappers.dart';
import 'package:data/src/mappers/common/hex_color_mapper.dart';
import 'package:data/src/mappers/core/core_mappers.dart';
import 'package:data/src/mappers/flights/service_guide_mapper.dart';
import 'package:data/src/mappers/services/services_mappers.dart';
import 'package:domain/domain.dart';

extension ServiceGroupMapper on ServiceGroupDto {
  ServiceGroup get toModel {
    return ServiceGroup(
      id: id,
      slug: slug,
      name: name,
      ordering: ordering ?? 0,
      isPriceOnRequest: isPriceOnRequest ?? false,
      items: items?.map((ServiceDto e) => e.toModel).toList() ?? <Service>[],
      icons: icons?.toModel,
      guides: guides?.map((ServiceGuideDto e) => e.toModel).toList() ?? <ServiceGuide>[],
      image: image?.toModel,
      description: description,
      seoTitle: seoTitle,
      seoDescription: seoDescription,
      workingHoursText: workingHoursText,
      rating: parseRatingString(rating),
      reviewsCount: reviewsCount ?? 0,
      startingFrom: startingFrom?.toModel,
      startingFromAutoEnabled: startingFromAutoEnabled ?? false,
      tag: tag?.toModel,
      reviews: reviews?.map((LocationReviewDto e) => e.toModel).toList() ?? <LocationReview>[],
      mainGuideId: mainGuideId,
    );
  }
}
