part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
@immutable
class UpdateOrderAccompanyingPersonDto {
  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  const UpdateOrderAccompanyingPersonDto({this.firstName, this.lastName});

  Map<String, dynamic> toJson() => _$UpdateOrderAccompanyingPersonDtoToJson(this);
}
