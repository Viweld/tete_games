part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false)
@immutable
class VerifyEmailRequestCodeDto {
  @JsonKey(name: 'email')
  final String email;

  const VerifyEmailRequestCodeDto({required this.email});

  Map<String, dynamic> toJson() => _$VerifyEmailRequestCodeDtoToJson(this);
}
