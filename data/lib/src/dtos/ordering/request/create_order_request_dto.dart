part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class CreateOrderRequestDto {
  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'currency')
  final String? currency;

  const CreateOrderRequestDto({required this.type, this.currency});

  Map<String, dynamic> toJson() => _$CreateOrderRequestDtoToJson(this);
}
