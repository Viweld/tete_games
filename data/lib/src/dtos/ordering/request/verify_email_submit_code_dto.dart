part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false)
@immutable
class VerifyEmailSubmitCodeDto {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'order_id')
  final String orderId;

  const VerifyEmailSubmitCodeDto({required this.email, required this.code, required this.orderId});

  Map<String, dynamic> toJson() => _$VerifyEmailSubmitCodeDtoToJson(this);
}
