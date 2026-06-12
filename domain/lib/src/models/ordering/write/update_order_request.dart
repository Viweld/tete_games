part of 'ordering_write_models.dart';

class UpdateOrderRequest {
  final String? contactName;
  final DateTime? contactDateOfBirth;
  final String? contactEmail;
  final String? contactPhone;
  final String? comment;
  final bool? hasReducedMobility;
  final int? adultsCount;
  final int? childrenCount;
  final int? infantsCount;
  final List<UpdateOrderTransfer>? transfersData;
  final List<int>? serviceIds;
  final List<UpdateOrderCondition>? conditionsData;
  final List<UpdateFlight>? flights;
  final List<UpdateOrderPassenger>? passengers;
  final List<UpdateOrderAccompanyingPerson>? accompanyingPersons;
  final bool? createAccount;
  final OrderingStep? step;
  final Set<UpdateOrderEndpointServices>? selectedServices;

  const UpdateOrderRequest({
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
}
