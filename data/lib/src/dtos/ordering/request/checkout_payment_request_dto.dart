part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class CheckoutPaymentRequestDto {
  @JsonKey(name: 'points_to_use')
  final int? pointsToUse;

  @JsonKey(name: 'currency')
  final String? currency;

  const CheckoutPaymentRequestDto({this.pointsToUse, this.currency});

  Map<String, dynamic> toJson() => _$CheckoutPaymentRequestDtoToJson(this);
}
