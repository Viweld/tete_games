part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class FinalizeMobilePaymentRequestDto {
  @JsonKey(name: 'payment_intent_id')
  final String paymentIntentId;

  @JsonKey(name: 'attempts')
  final int attempts;

  const FinalizeMobilePaymentRequestDto({required this.paymentIntentId, required this.attempts});

  Map<String, dynamic> toJson() => _$FinalizeMobilePaymentRequestDtoToJson(this);
}
