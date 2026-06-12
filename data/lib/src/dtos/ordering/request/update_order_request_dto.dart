part of '../ordering_dtos.dart';

@JsonSerializable(createFactory: false, includeIfNull: false, explicitToJson: true)
@immutable
class UpdateOrderRequestDto {
  @JsonKey(name: 'contact_name')
  final String? contactName;

  @JsonKey(name: 'contact_date_of_birth')
  final String? contactDateOfBirth;

  @JsonKey(name: 'contact_email')
  final String? contactEmail;

  @JsonKey(name: 'contact_phone')
  final String? contactPhone;

  @JsonKey(name: 'comment')
  final String? comment;

  @JsonKey(name: 'has_reduced_mobility')
  final bool? hasReducedMobility;

  @JsonKey(name: 'adults_count')
  final int? adultsCount;

  @JsonKey(name: 'children_count')
  final int? childrenCount;

  @JsonKey(name: 'infants_count')
  final int? infantsCount;

  @JsonKey(name: 'transfers_data')
  final List<UpdateOrderTransferDto>? transfersData;

  @JsonKey(name: 'service_ids')
  final List<int>? serviceIds;

  @JsonKey(name: 'conditions_data')
  final List<UpdateOrderConditionDto>? conditionsData;

  @JsonKey(name: 'flights')
  final List<UpdateFlightDto>? flights;

  @JsonKey(name: 'passengers')
  final List<UpdateOrderPassengerDto>? passengers;

  @JsonKey(name: 'accompanying_persons')
  final List<UpdateOrderAccompanyingPersonDto>? accompanyingPersons;

  @JsonKey(name: 'create_account')
  final bool? createAccount;

  @JsonKey(name: 'step')
  final int? step;

  @JsonKey(name: 'selected_services')
  final List<UpdateOrderEndpointServicesDto>? selectedServices;

  const UpdateOrderRequestDto({
    this.contactName,
    this.contactDateOfBirth,
    this.contactEmail,
    this.contactPhone,
    this.comment,
    this.hasReducedMobility,
    this.adultsCount,
    this.childrenCount,
    this.infantsCount,
    this.transfersData,
    this.serviceIds,
    this.conditionsData,
    this.flights,
    this.passengers,
    this.accompanyingPersons,
    this.createAccount,
    this.step,
    this.selectedServices,
  });

  Map<String, dynamic> toJson() => _$UpdateOrderRequestDtoToJson(this);
}
