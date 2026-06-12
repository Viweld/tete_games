part of 'ordering_read_mappers.dart';

extension OrderDtoMapper on OrderDto {
  OrderDraft get toModel => OrderDraft(
    id: id,
    refNumber: refNumber ?? '',
    status: OrderStatus.fromString(status),
    type: OrderType.fromString(type),
    totalAmount: double.tryParse('$totalAmount'),
    currency: currency ?? 'USD',
    currencySymbol: currencySymbol ?? '',
    paymentDeadline: paymentDeadline != null ? DateTime.tryParse(paymentDeadline!) : null,
    contactName: contactName,
    contactEmail: contactEmail,
    contactPhone: contactPhone,
    contactDateOfBirth: contactDateOfBirth,
    adultsCount: adultsCount ?? 1,
    childrenCount: childrenCount ?? 0,
    infantsCount: infantsCount ?? 0,
    hasReducedMobility: hasReducedMobility ?? false,
    serviceIds: serviceIds ?? const <int>[],
    items: items?.map((OrderItemDto e) => e.toModel).toList() ?? const <OrderItem>[],
    conditions:
        conditions?.map((OrderConditionDto e) => e.toModel).toList() ?? const <OrderCondition>[],
    flights: flights?.map((OrderFlightDto e) => e.toModel).toList() ?? const <OrderFlight>[],
    passengers:
        passengers?.map((OrderPassengerDto e) => e.toModel).toList() ?? const <OrderPassenger>[],
    accompanyingPersons:
        accompanyingPersons?.map((OrderAccompanyingPersonDto e) => e.toModel).toList() ??
        const <OrderAccompanyingPerson>[],
    transfers:
        transfers?.map((OrderTransferDto e) => e.toModel).toList() ?? const <OrderTransfer>[],
    summary: summary?.toModel,
    createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
    comment: comment,
    availablePoints: availablePoints,
    maxPointsUse: maxPointsUse,
    potentialCashback: potentialCashback,
    exchangeRate: exchangeRate,
    userBalancePoints: userBalancePoints,
    userBalanceMoney: userBalanceMoney,
    maxPointsToUse: maxPointsToUse,
    maxDiscountMoney: maxDiscountMoney,
    step: switch (step) {
      11 => OrderingStep.flightsSelected,
      12 => OrderingStep.conditionsSelected,
      121 => OrderingStep.departureServicesSelected,
      122 => OrderingStep.transitServicesSelected,
      123 => OrderingStep.transitArrivalServicesSelected,
      124 => OrderingStep.transitDepartureServicesSelected,
      125 => OrderingStep.arrivalServicesSelected,
      21 => OrderingStep.transferCustomized,
      30 => OrderingStep.travelersSelected,
      _ => null,
    },
    selectedServices: selectedServices?.map((OrderEndpointServicesDto e) => e.toModel).toSet(),
  );
}
