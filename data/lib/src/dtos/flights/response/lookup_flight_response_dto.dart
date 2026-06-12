part of '../flights_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class LookupFlightResponseDto {
  @JsonKey(name: 'success')
  final bool? success;

  @JsonKey(name: 'data')
  final FlightDto? data;

  const LookupFlightResponseDto({this.success, this.data});

  factory LookupFlightResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LookupFlightResponseDtoFromJson(json);
}
