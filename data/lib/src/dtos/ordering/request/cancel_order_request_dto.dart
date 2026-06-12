part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false, explicitToJson: true)
@immutable
class CancelOrderRequestDto {
  @JsonKey(name: 'ref_number')
  final String orderNumber;

  @JsonKey(name: 'email')
  final String email;

  const CancelOrderRequestDto({required this.orderNumber, required this.email});

  Map<String, dynamic> toJson() => _$CancelOrderRequestDtoToJson(this);
}
