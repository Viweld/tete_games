// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flights_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightAircraftDto _$FlightAircraftDtoFromJson(Map<String, dynamic> json) =>
    FlightAircraftDto(
      model: json['model'] as String?,
      registration: json['registration'] as String?,
    );

FlightDto _$FlightDtoFromJson(Map<String, dynamic> json) => FlightDto(
  flightNumber: json['flight_number'] as String?,
  airlineIata: json['airline_iata'] as String?,
  airlineName: json['airline_name'] as String?,
  status: json['status'] as String?,
  durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
  aircraft: json['aircraft'] == null
      ? null
      : FlightAircraftDto.fromJson(json['aircraft'] as Map<String, dynamic>),
  departure: json['departure'] == null
      ? null
      : FlightEndpointDto.fromJson(json['departure'] as Map<String, dynamic>),
  arrival: json['arrival'] == null
      ? null
      : FlightEndpointDto.fromJson(json['arrival'] as Map<String, dynamic>),
);

FlightEndpointDto _$FlightEndpointDtoFromJson(Map<String, dynamic> json) =>
    FlightEndpointDto(
      iataCode: json['iataCode'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      airportCode: json['airport_code'] as String?,
      airportName: json['airport_name'] as String?,
      description: json['description'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceGroups: (json['serviceGroups'] as List<dynamic>?)
          ?.map((e) => ServiceGroupDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      importantInfo: json['importantInfo'] as Map<String, dynamic>?,
      status: json['status'] as String?,
      terminal: json['terminal'] as String?,
      gate: json['gate'] as String?,
      scheduledTime: json['scheduled_time'] == null
          ? null
          : DateTime.parse(json['scheduled_time'] as String),
      estimatedTime: json['estimated_time'] == null
          ? null
          : DateTime.parse(json['estimated_time'] as String),
      timezone: json['timezone'] as String?,
      cityName: json['city_name'] as String?,
      systemAirportId: (json['system_airport_id'] as num?)?.toInt(),
      terminals: (json['terminals'] as List<dynamic>?)
          ?.map((e) => TerminalDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPublished: json['isPublished'] as bool?,
      popularityScore: (json['popularityScore'] as num?)?.toInt(),
    );

LookupFlightResponseDto _$LookupFlightResponseDtoFromJson(
  Map<String, dynamic> json,
) => LookupFlightResponseDto(
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : FlightDto.fromJson(json['data'] as Map<String, dynamic>),
);

ServiceGroupDto _$ServiceGroupDtoFromJson(Map<String, dynamic> json) =>
    ServiceGroupDto(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      ordering: (json['ordering'] as num?)?.toInt(),
      isPriceOnRequest: json['is_price_on_request'] as bool?,
      icons: json['icons'] == null
          ? null
          : VectorImageDto.fromJson(json['icons'] as Map<String, dynamic>),
      guides: (json['guides'] as List<dynamic>?)
          ?.map((e) => ServiceGuideDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ServiceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] == null
          ? null
          : PhotoDto.fromJson(json['image'] as Map<String, dynamic>),
      description: json['description'] as String?,
      seoTitle: json['seo_title'] as String?,
      seoDescription: json['seo_description'] as String?,
      workingHoursText: json['working_hours_text'] as String?,
      rating: json['rating'] as String?,
      reviewsCount: (json['reviews_count'] as num?)?.toInt(),
      startingFrom: json['starting_from'] == null
          ? null
          : MoneyDto.fromJson(json['starting_from'] as Map<String, dynamic>),
      startingFromAutoEnabled: json['starting_from_auto_enabled'] as bool?,
      tag: json['tag'] == null
          ? null
          : MarketingTagDto.fromJson(json['tag'] as Map<String, dynamic>),
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((e) => LocationReviewDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      mainGuideId: (json['main_guide_id'] as num?)?.toInt(),
    );

ServiceGuideDto _$ServiceGuideDtoFromJson(Map<String, dynamic> json) =>
    ServiceGuideDto(
      title: json['title'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
      ordering: (json['ordering'] as num?)?.toInt(),
      renderVariant: json['render_variant'] as String?,
      isMain: json['is_main'] as bool?,
    );
