part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderAccompanyingPersonDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  const OrderAccompanyingPersonDto({required this.id, this.firstName, this.lastName});

  factory OrderAccompanyingPersonDto.fromJson(Map<String, dynamic> json) =>
      _$OrderAccompanyingPersonDtoFromJson(json);
}
