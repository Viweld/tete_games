part of 'ordering_read_models.dart';

@immutable
class OrderDraft {
  final String id;
  final String refNumber;
  final OrderStatus status;
  final OrderType type;
  final String currency;
  final String currencySymbol;
  final double? totalAmount;
  final DateTime? paymentDeadline;
  final String? contactName;
  final String? contactEmail;
  final String? contactPhone;
  final String? contactDateOfBirth;
  final int adultsCount;
  final int childrenCount;
  final int infantsCount;
  final bool hasReducedMobility;
  final List<int> serviceIds;
  final List<OrderItem> items;
  final List<OrderCondition> conditions;
  final List<OrderFlight> flights;
  final List<OrderPassenger> passengers;
  final List<OrderAccompanyingPerson> accompanyingPersons;
  final List<OrderTransfer> transfers;
  final OrderSummaryRaw? summary;
  final DateTime? createdAt;
  final String? comment;
  final double? availablePoints;
  final double? maxPointsUse;
  final double? potentialCashback;
  final double? exchangeRate;
  final double? userBalancePoints;
  final double? userBalanceMoney;
  final double? maxPointsToUse;
  final double? maxDiscountMoney;
  final OrderingStep? step;
  final Set<OrderEndpointServices>? selectedServices;

  const OrderDraft({
    required this.id,
    required this.refNumber,
    required this.status,
    required this.type,
    required this.currency,
    required this.currencySymbol,
    this.totalAmount,
    this.paymentDeadline,
    this.contactName,
    this.contactEmail,
    this.contactPhone,
    this.contactDateOfBirth,
    this.adultsCount = 1,
    this.childrenCount = 0,
    this.infantsCount = 0,
    this.hasReducedMobility = false,
    this.serviceIds = const <int>[],
    this.items = const <OrderItem>[],
    this.conditions = const <OrderCondition>[],
    this.flights = const <OrderFlight>[],
    this.passengers = const <OrderPassenger>[],
    this.accompanyingPersons = const <OrderAccompanyingPerson>[],
    this.transfers = const <OrderTransfer>[],
    this.summary,
    this.createdAt,
    this.comment,
    this.availablePoints,
    this.maxPointsUse,
    this.potentialCashback,
    this.exchangeRate,
    this.userBalancePoints,
    this.userBalanceMoney,
    this.maxPointsToUse,
    this.maxDiscountMoney,
    this.step,
    this.selectedServices,
  });

  double discountInOrderCurrencyForPoints(double pointsToUse) =>
      pointsToUse * (exchangeRate ?? 1.0);

  double payableTotalAfterPoints({
    required double grossTotalInOrderCurrency,
    required double pointsToUse,
  }) {
    final double discount = discountInOrderCurrencyForPoints(pointsToUse);
    final double payable = grossTotalInOrderCurrency - discount;
    return payable < 0 ? 0 : payable;
  }

  Map<EndpointType, Endpoint> get endpointsMap {
    final Map<EndpointType, Endpoint> map = <EndpointType, Endpoint>{};

    if (flights.isEmpty) return map;

    if (flights.length == 1) {
      final OrderFlight flight1 = flights[0];
      map[EndpointType.departure] = Endpoint(
        airportIataCode: flight1.departureAirportCode,
        airportName: flight1.departureAirportName,
        terminalId: flight1.departureTerminalId,
        terminalName: flight1.departureTerminalName,
        country: flight1.departureCountry,
        city: flight1.departureCity,
      );
      map[EndpointType.arrival] = Endpoint(
        airportIataCode: flight1.arrivalAirportCode,
        airportName: flight1.arrivalAirportName,
        terminalId: flight1.arrivalTerminalId,
        terminalName: flight1.arrivalTerminalName,
        country: flight1.arrivalCountry,
        city: flight1.arrivalCity,
      );
    } else if (flights.length == 2) {
      final OrderFlight flight1 = flights[0];
      final OrderFlight flight2 = flights[1];

      map[EndpointType.departure] = Endpoint(
        airportIataCode: flight1.departureAirportCode,
        airportName: flight1.departureAirportName,
        terminalId: flight1.departureTerminalId,
        terminalName: flight1.departureTerminalName,
        country: flight1.departureCountry,
        city: flight1.departureCity,
      );

      final Endpoint transitArrival = Endpoint(
        airportIataCode: flight1.arrivalAirportCode,
        airportName: flight1.arrivalAirportName,
        terminalId: flight1.arrivalTerminalId,
        terminalName: flight1.arrivalTerminalName,
        country: flight1.arrivalCountry,
        city: flight1.arrivalCity,
      );

      final Endpoint transitDeparture = Endpoint(
        airportIataCode: flight2.departureAirportCode,
        airportName: flight2.departureAirportName,
        terminalId: flight2.departureTerminalId,
        terminalName: flight2.departureTerminalName,
        country: flight2.departureCountry,
        city: flight2.departureCity,
      );

      if (transitArrival == transitDeparture) {
        map[EndpointType.transit] = transitArrival;
      } else {
        map[EndpointType.transitArrival] = transitArrival;
        map[EndpointType.transitDeparture] = transitDeparture;
      }

      map[EndpointType.arrival] = Endpoint(
        airportIataCode: flight2.arrivalAirportCode,
        airportName: flight2.arrivalAirportName,
        terminalId: flight2.arrivalTerminalId,
        terminalName: flight2.arrivalTerminalName,
        country: flight2.arrivalCountry,
        city: flight2.arrivalCity,
      );
    }

    return map;
  }

  OrderSummary get generatedSummary {
    if (summary == null) {
      return OrderSummary(
        totalAmount: 0.0,
        currency: currency,
        endpoints: const <EndpointSummary>[],
      );
    }

    final OrderSummaryRaw backendSummary = summary!;
    final Map<EndpointType, Endpoint> endpoints = endpointsMap;
    final Map<EndpointType, List<SummaryItem>> groupedItems = <EndpointType, List<SummaryItem>>{};

    for (final SummaryItem item in backendSummary.servicesBreakdown) {
      if (item.endpointType != null) {
        groupedItems.putIfAbsent(item.endpointType!, () => <SummaryItem>[]).add(item);
      }
    }

    final List<EndpointSummary> endpointSummaries = <EndpointSummary>[];
    for (final MapEntry<EndpointType, Endpoint> entry in endpoints.entries) {
      final EndpointType endpointType = entry.key;
      final Endpoint endpoint = entry.value;
      final List<SummaryItem> endpointItems = groupedItems[endpointType] ?? <SummaryItem>[];

      final SummaryItem? transferItem = endpointItems
          .where((SummaryItem item) => item.transferId != null)
          .firstOrNull;
      OrderTransfer? transfer;
      if (transferItem != null) {
        transfer = OrderTransfer(
          id: transferItem.transferId!,
          pickupAddress: transferItem.pickupAddress,
          dropoffAddress: transferItem.dropoffAddress,
          stopsList: transferItem.stopsList,
          airport: SimpleAirport(
            id: 0,
            iataCode: endpoint.airportIataCode,
            name: endpoint.airportName ?? '',
          ),
        );
      }

      endpointSummaries.add(
        EndpointSummary(
          type: endpointType,
          airportName: endpoint.airportName ?? '',
          airportIataCode: endpoint.airportIataCode ?? '',
          terminalName: endpoint.terminalName ?? '',
          country: endpoint.country ?? '',
          city: endpoint.city ?? '',
          servicesBreakdown: endpointItems,
          transfer:
              transfer ??
              transfers.firstWhereOrNull((OrderTransfer t) {
                return t.airport?.iataCode == endpoint.airportIataCode &&
                    (t.date ==
                        switch (endpointType) {
                          EndpointType.departure => flights.firstOrNull?.flightDate,
                          EndpointType.transitArrival => flights.firstOrNull?.flightDate,
                          EndpointType.transit => flights.firstOrNull?.flightDate,
                          EndpointType.transitDeparture => flights.lastOrNull?.flightDate,
                          EndpointType.arrival => flights.lastOrNull?.flightDate,
                        });
              }),
        ),
      );
    }

    return OrderSummary(
      totalAmount: backendSummary.totalAmount,
      currency: backendSummary.currency,
      endpoints: endpointSummaries,
    );
  }
}
