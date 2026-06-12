// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travelers_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateTravelerRequestDtoToJson(
  CreateTravelerRequestDto instance,
) => <String, dynamic>{
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'date_of_birth': instance.dateOfBirth,
  'gender': instance.gender,
  'citizenship_iso': ?instance.citizenshipIso,
};

Map<String, dynamic> _$UpdateTravelerRequestDtoToJson(
  UpdateTravelerRequestDto instance,
) => <String, dynamic>{
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'date_of_birth': ?instance.dateOfBirth,
  'gender': ?instance.gender,
  'citizenship_iso': ?instance.citizenshipIso,
};

TravelerDto _$TravelerDtoFromJson(Map<String, dynamic> json) => TravelerDto(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  gender: json['gender'] as String?,
  citizenshipInfo: json['citizenship_info'] == null
      ? null
      : CountryDto.fromJson(json['citizenship_info'] as Map<String, dynamic>),
);
