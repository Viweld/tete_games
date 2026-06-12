part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderTransferStopDto {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'address')
  final String? address;

  @JsonKey(name: 'ordering')
  final int? ordering;

  const OrderTransferStopDto({required this.id, this.address, this.ordering});

  factory OrderTransferStopDto.fromJson(Map<String, dynamic> json) =>
      _$OrderTransferStopDtoFromJson(json);
}
