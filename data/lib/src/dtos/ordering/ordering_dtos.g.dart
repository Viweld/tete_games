// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordering_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateOrderRequestDtoToJson(
  CreateOrderRequestDto instance,
) => <String, dynamic>{'type': instance.type, 'currency': ?instance.currency};

Map<String, dynamic> _$UpdateFlightDtoToJson(UpdateFlightDto instance) =>
    <String, dynamic>{
      'flight_number': ?instance.flightNumber,
      'flight_date': ?instance.flightDate,
      'departure_airport': ?instance.departureAirportCode,
      'arrival_airport': ?instance.arrivalAirportCode,
      'departure_airport_name': ?instance.departureAirportName,
      'arrival_airport_name': ?instance.arrivalAirportName,
      'departure_terminal_id': ?instance.departureTerminalId,
      'departure_terminal_name': ?instance.departureTerminalName,
      'arrival_terminal_id': ?instance.arrivalTerminalId,
      'arrival_terminal_name': ?instance.arrivalTerminalName,
      'airline_name': ?instance.airlineName,
      'departure_time': ?instance.departureTime,
      'arrival_time': ?instance.arrivalTime,
    };

Map<String, dynamic> _$CancelOrderRequestDtoToJson(
  CancelOrderRequestDto instance,
) => <String, dynamic>{
  'ref_number': instance.orderNumber,
  'email': instance.email,
};

Map<String, dynamic> _$UpdateOrderAccompanyingPersonDtoToJson(
  UpdateOrderAccompanyingPersonDto instance,
) => <String, dynamic>{
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
};

Map<String, dynamic> _$UpdateOrderConditionDtoToJson(
  UpdateOrderConditionDto instance,
) => <String, dynamic>{'id': ?instance.id, 'text': ?instance.text};

Map<String, dynamic> _$UpdateOrderPassengerDtoToJson(
  UpdateOrderPassengerDto instance,
) => <String, dynamic>{
  'first_name': ?instance.firstName,
  'last_name': ?instance.lastName,
  'date_of_birth': ?instance.dateOfBirth,
  'gender': ?instance.gender,
  'citizenship_iso': ?instance.citizenshipIso,
};

Map<String, dynamic> _$UpdateOrderRequestDtoToJson(
  UpdateOrderRequestDto instance,
) => <String, dynamic>{
  'contact_name': ?instance.contactName,
  'contact_date_of_birth': ?instance.contactDateOfBirth,
  'contact_email': ?instance.contactEmail,
  'contact_phone': ?instance.contactPhone,
  'comment': ?instance.comment,
  'has_reduced_mobility': ?instance.hasReducedMobility,
  'adults_count': ?instance.adultsCount,
  'children_count': ?instance.childrenCount,
  'infants_count': ?instance.infantsCount,
  'transfers_data': ?instance.transfersData?.map((e) => e.toJson()).toList(),
  'service_ids': ?instance.serviceIds,
  'conditions_data': ?instance.conditionsData?.map((e) => e.toJson()).toList(),
  'flights': ?instance.flights?.map((e) => e.toJson()).toList(),
  'passengers': ?instance.passengers?.map((e) => e.toJson()).toList(),
  'accompanying_persons': ?instance.accompanyingPersons
      ?.map((e) => e.toJson())
      .toList(),
  'create_account': ?instance.createAccount,
  'step': ?instance.step,
  'selected_services': ?instance.selectedServices
      ?.map((e) => e.toJson())
      .toList(),
};

Map<String, dynamic> _$UpdateOrderTransferDtoToJson(
  UpdateOrderTransferDto instance,
) => <String, dynamic>{
  'service_id': ?instance.serviceId,
  'flight_number': ?instance.flightNumber,
  'date': ?instance.date,
  'time': ?instance.time,
  'pickup_address': ?instance.pickupAddress,
  'dropoff_address': ?instance.dropoffAddress,
  'stops': ?instance.stops,
};

Map<String, dynamic> _$UpdateOrderEndpointServicesDtoToJson(
  UpdateOrderEndpointServicesDto instance,
) => <String, dynamic>{
  'iata_code': instance.iataCode,
  'terminal_id': ?instance.terminalId,
  'terminal_name': instance.terminalName,
  'endpoint_type': instance.endpointType,
  'service_ids': instance.serviceIds,
};

OrderEndpointServicesDto _$OrderEndpointServicesDtoFromJson(
  Map<String, dynamic> json,
) => OrderEndpointServicesDto(
  iataCode: json['iata_code'] as String,
  terminalId: (json['terminal_id'] as num).toInt(),
  terminalName: json['terminal_name'] as String,
  endpointType: json['endpoint_type'] as String,
  serviceIds: (json['service_ids'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$VerifyEmailRequestCodeDtoToJson(
  VerifyEmailRequestCodeDto instance,
) => <String, dynamic>{'email': instance.email};

Map<String, dynamic> _$VerifyEmailSubmitCodeDtoToJson(
  VerifyEmailSubmitCodeDto instance,
) => <String, dynamic>{
  'email': instance.email,
  'code': instance.code,
  'order_id': instance.orderId,
};

Map<String, dynamic> _$CheckoutPaymentRequestDtoToJson(
  CheckoutPaymentRequestDto instance,
) => <String, dynamic>{
  'points_to_use': ?instance.pointsToUse,
  'currency': ?instance.currency,
};

Map<String, dynamic> _$FinalizeMobilePaymentRequestDtoToJson(
  FinalizeMobilePaymentRequestDto instance,
) => <String, dynamic>{
  'payment_intent_id': instance.paymentIntentId,
  'attempts': instance.attempts,
};

Map<String, dynamic> _$PrivateJetBookingRequestDtoToJson(
  PrivateJetBookingRequestDto instance,
) => <String, dynamic>{
  'departure_airport': instance.departureAirport,
  'arrival_airport': instance.arrivalAirport,
  'date': instance.date,
  'passengers_count': instance.passengersCount,
  'jet_id': ?instance.jetId,
  'jet_model': ?instance.jetModel,
  'contact_name': instance.contactName,
  'contact_email': instance.contactEmail,
  'contact_phone': instance.contactPhone,
  'comment': ?instance.comment,
};

OrderAccompanyingPersonDto _$OrderAccompanyingPersonDtoFromJson(
  Map<String, dynamic> json,
) => OrderAccompanyingPersonDto(
  id: (json['id'] as num).toInt(),
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
);

OrderConditionDto _$OrderConditionDtoFromJson(Map<String, dynamic> json) =>
    OrderConditionDto(
      id: (json['id'] as num).toInt(),
      key: json['key'] as String?,
      title: json['title'] as String?,
      value: json['value'] as String?,
    );

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
  id: json['id'] as String,
  refNumber: json['ref_number'] as String?,
  status: json['status'] as String?,
  type: json['type'] as String?,
  totalAmount: json['total_amount'],
  currency: json['currency'] as String?,
  currencySymbol: json['currency_symbol'] as String?,
  paymentDeadline: json['payment_deadline'] as String?,
  contactName: json['contact_name'] as String?,
  contactEmail: json['contact_email'] as String?,
  contactPhone: json['contact_phone'] as String?,
  contactDateOfBirth: json['contact_date_of_birth'] as String?,
  adultsCount: (json['adults_count'] as num?)?.toInt(),
  childrenCount: (json['children_count'] as num?)?.toInt(),
  infantsCount: (json['infants_count'] as num?)?.toInt(),
  hasReducedMobility: json['has_reduced_mobility'] as bool?,
  serviceIds: _serviceIdsFromJson(json['service_ids']),
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  conditions: (json['conditions'] as List<dynamic>?)
      ?.map((e) => OrderConditionDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  flights: (json['flights'] as List<dynamic>?)
      ?.map((e) => OrderFlightDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  passengers: (json['passengers'] as List<dynamic>?)
      ?.map((e) => OrderPassengerDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  accompanyingPersons: (json['accompanying_persons'] as List<dynamic>?)
      ?.map(
        (e) => OrderAccompanyingPersonDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  transfers: (json['transfers'] as List<dynamic>?)
      ?.map((e) => OrderTransferDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  summary: json['summary'] == null
      ? null
      : OrderSummaryDto.fromJson(json['summary'] as Map<String, dynamic>),
  createdAt: json['created_at'] as String?,
  comment: json['comment'] as String?,
  availablePoints: (json['available_points'] as num?)?.toDouble(),
  maxPointsUse: (json['max_points_use'] as num?)?.toDouble(),
  potentialCashback: (json['potential_cashback'] as num?)?.toDouble(),
  exchangeRate: (json['exchange_rate'] as num?)?.toDouble(),
  userBalancePoints: (json['user_balance_points'] as num?)?.toDouble(),
  userBalanceMoney: (json['user_balance_money'] as num?)?.toDouble(),
  maxPointsToUse: (json['max_points_to_use'] as num?)?.toDouble(),
  maxDiscountMoney: (json['max_discount_money'] as num?)?.toDouble(),
  step: (json['step'] as num?)?.toInt(),
  selectedServices: (json['selected_services'] as List<dynamic>?)
      ?.map((e) => OrderEndpointServicesDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

CheckoutPaymentResponseDto _$CheckoutPaymentResponseDtoFromJson(
  Map<String, dynamic> json,
) => CheckoutPaymentResponseDto(
  status: json['status'] as String?,
  cashToPay: json['cash_to_pay'] as String?,
  pointsUsed: (json['points_used'] as num?)?.toInt(),
  discountAmount: json['discount_amount'] as String?,
  cashbackToEarn: (json['cashback_to_earn'] as num?)?.toInt(),
  paymentIntent: json['payment_intent'] as String?,
  customer: json['customer'] as String?,
  ephemeralKey: json['ephemeral_key'] as String?,
  publishableKey: json['publishable_key'] as String?,
);

FinalizePaymentResponseDto _$FinalizePaymentResponseDtoFromJson(
  Map<String, dynamic> json,
) => FinalizePaymentResponseDto(
  status: json['status'] as String?,
  reconciled: json['reconciled'] as bool?,
  awaitingWebhook: json['awaiting_webhook'] as bool?,
  paymentIntentId: json['payment_intent_id'] as String?,
  hasPaymentTransaction: json['has_payment_transaction'] as bool?,
);

OrderFlightDto _$OrderFlightDtoFromJson(Map<String, dynamic> json) =>
    OrderFlightDto(
      id: (json['id'] as num).toInt(),
      flightNumber: json['flight_number'] as String?,
      flightDate: json['flight_date'] as String?,
      departureTerminalId: (json['departure_terminal_id'] as num?)?.toInt(),
      departureTerminalName: json['departure_terminal_name'] as String?,
      arrivalTerminalId: (json['arrival_terminal_id'] as num?)?.toInt(),
      arrivalTerminalName: json['arrival_terminal_name'] as String?,
      departureAirportCode: json['departure_airport'] as String?,
      arrivalAirportCode: json['arrival_airport'] as String?,
      departureAirportName: json['departure_airport_name'] as String?,
      arrivalAirportName: json['arrival_airport_name'] as String?,
      departureCountry: json['departure_country'] as String?,
      arrivalCountry: json['arrival_country'] as String?,
      departureCity: json['departure_city'] as String?,
      arrivalCity: json['arrival_city'] as String?,
      departureTime: json['departure_time'] as String?,
      arrivalTime: json['arrival_time'] as String?,
      airlineName: json['airline_name'] as String?,
    );

OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) => OrderItemDto(
  id: (json['id'] as num).toInt(),
  serviceId: (json['service_id'] as num?)?.toInt(),
  serviceName: json['serviceName'] as String?,
  category: json['category'] == null
      ? null
      : SimpleCategoryDto.fromJson(json['category'] as Map<String, dynamic>),
  airport: json['airport'] == null
      ? null
      : SimpleAirportDto.fromJson(json['airport'] as Map<String, dynamic>),
  country: json['country'] as String?,
  airportPhoto: json['airport_photo'] == null
      ? null
      : PhotoDto.fromJson(json['airport_photo'] as Map<String, dynamic>),
  terminal: json['terminal'] == null
      ? null
      : TerminalDto.fromJson(json['terminal'] as Map<String, dynamic>),
  adultsCount: (json['adults_count'] as num?)?.toInt(),
  childrenCount: (json['children_count'] as num?)?.toInt(),
  infantsCount: (json['infants_count'] as num?)?.toInt(),
  prices: (json['prices'] as List<dynamic>?)
      ?.map((e) => OrderItemPriceDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  totalPrice: json['total_price'],
  currency: json['currency'] as String?,
  currencySymbol: json['currency_symbol'] as String?,
);

OrderItemPriceDto _$OrderItemPriceDtoFromJson(Map<String, dynamic> json) =>
    OrderItemPriceDto(
      currency: json['currency'] as String?,
      adultPrice: json['adult_price'] as num?,
      childPrice: json['child_price'] as num?,
      infantPrice: json['infant_price'] as num?,
      isManual: json['is_manual'] as bool?,
    );

OrderPassengerDto _$OrderPassengerDtoFromJson(Map<String, dynamic> json) =>
    OrderPassengerDto(
      id: (json['id'] as num).toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      citizenshipIso: json['citizenship_iso'] as String?,
    );

OrderSummaryDto _$OrderSummaryDtoFromJson(Map<String, dynamic> json) =>
    OrderSummaryDto(
      flightInfo: json['flight_info'] as Map<String, dynamic>?,
      servicesBreakdown: (json['services_breakdown'] as List<dynamic>?)
          ?.map((e) => SummaryItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: json['total_amount'],
      currency: json['currency'] as String?,
    );

OrderTransferDto _$OrderTransferDtoFromJson(Map<String, dynamic> json) =>
    OrderTransferDto(
      id: (json['id'] as num).toInt(),
      date: json['date'] as String?,
      time: json['time'] as String?,
      pickupAddress: json['pickup_address'] as String?,
      dropoffAddress: json['dropoff_address'] as String?,
      flightNumber: json['flight_number'] as String?,
      serviceId: (json['service_id'] as num?)?.toInt(),
      serviceName: json['service_name'] as String?,
      category: json['category'] == null
          ? null
          : SimpleCategoryDto.fromJson(
              json['category'] as Map<String, dynamic>,
            ),
      airport: json['airport'] == null
          ? null
          : SimpleAirportDto.fromJson(json['airport'] as Map<String, dynamic>),
      terminal: json['terminal'] == null
          ? null
          : TerminalDto.fromJson(json['terminal'] as Map<String, dynamic>),
      isPaid: json['is_paid'] as bool?,
      paymentAmount: json['payment_amount'],
      paymentCurrency: json['payment_currency'] as String?,
      stopsList: (json['stops_list'] as List<dynamic>?)
          ?.map((e) => OrderTransferStopDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

OrderTransferStopDto _$OrderTransferStopDtoFromJson(
  Map<String, dynamic> json,
) => OrderTransferStopDto(
  id: (json['id'] as num).toInt(),
  address: json['address'] as String?,
  ordering: (json['ordering'] as num?)?.toInt(),
);

SummaryItemDto _$SummaryItemDtoFromJson(Map<String, dynamic> json) =>
    SummaryItemDto(
      name: json['name'] as String?,
      pricePerUnit: json['price_per_unit'],
      currency: json['currency'] as String?,
      count: (json['count'] as num?)?.toInt(),
      total: json['total'],
      note: json['note'] as String?,
      endpointType: json['endpoint_type'] as String?,
      iataCode: json['iata_code'] as String?,
      terminalName: json['terminal_name'] as String?,
      passengersCount: (json['passengers_count'] as num?)?.toInt(),
      serviceId: (json['service_id'] as num?)?.toInt(),
      pickupAddress: json['pickup_address'] as String?,
      dropoffAddress: json['dropoff_address'] as String?,
      transferId: (json['transfer_id'] as num?)?.toInt(),
      stopsList: (json['stops_list'] as List<dynamic>?)
          ?.map((e) => OrderTransferStopDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
