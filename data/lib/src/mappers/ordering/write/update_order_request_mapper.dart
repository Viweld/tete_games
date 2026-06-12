part of 'ordering_write_mappers.dart';

extension UpdateOrderRequestMapper on UpdateOrderRequest {
  UpdateOrderRequestDto get toDto {
    final DateFormat outputFormat = DateFormat('yyyy-MM-dd');

    return UpdateOrderRequestDto(
      contactName: contactName,
      contactDateOfBirth: contactDateOfBirth != null
          ? outputFormat.format(contactDateOfBirth!)
          : null,
      contactEmail: contactEmail,
      contactPhone: contactPhone,
      comment: comment,
      hasReducedMobility: hasReducedMobility,
      adultsCount: adultsCount,
      childrenCount: childrenCount,
      infantsCount: infantsCount,
      transfersData: transfersData?.map((UpdateOrderTransfer e) => e.toDto).toList(),
      serviceIds: serviceIds,
      conditionsData: conditionsData?.map((UpdateOrderCondition e) => e.toDto).toList(),
      flights: flights?.map((UpdateFlight e) => e.toDto).toList(),
      passengers: passengers?.map((UpdateOrderPassenger e) => e.toDto).toList(),
      accompanyingPersons: accompanyingPersons
          ?.map((UpdateOrderAccompanyingPerson e) => e.toDto)
          .toList(),
      createAccount: createAccount,
      step: switch (step) {
        OrderingStep.flightsSelected => 11,
        OrderingStep.conditionsSelected => 12,
        OrderingStep.departureServicesSelected => 121,
        OrderingStep.transitServicesSelected => 122,
        OrderingStep.transitArrivalServicesSelected => 123,
        OrderingStep.transitDepartureServicesSelected => 124,
        OrderingStep.arrivalServicesSelected => 125,
        OrderingStep.transferCustomized => 21,
        OrderingStep.travelersSelected => 30,
        null => null,
      },
      selectedServices: selectedServices?.map((UpdateOrderEndpointServices e) => e.toDto).toList(),
    );
  }
}
