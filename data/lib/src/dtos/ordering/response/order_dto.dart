part of '../ordering_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class OrderDto {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'ref_number')
  final String? refNumber;

  @JsonKey(name: 'status')
  final String? status;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'total_amount')
  final Object? totalAmount;

  @JsonKey(name: 'currency')
  final String? currency;

  @JsonKey(name: 'currency_symbol')
  final String? currencySymbol;

  @JsonKey(name: 'payment_deadline')
  final String? paymentDeadline;

  @JsonKey(name: 'contact_name')
  final String? contactName;

  @JsonKey(name: 'contact_email')
  final String? contactEmail;

  @JsonKey(name: 'contact_phone')
  final String? contactPhone;

  @JsonKey(name: 'contact_date_of_birth')
  final String? contactDateOfBirth;

  @JsonKey(name: 'adults_count')
  final int? adultsCount;

  @JsonKey(name: 'children_count')
  final int? childrenCount;

  @JsonKey(name: 'infants_count')
  final int? infantsCount;

  @JsonKey(name: 'has_reduced_mobility')
  final bool? hasReducedMobility;

  @JsonKey(name: 'service_ids', fromJson: _serviceIdsFromJson)
  final List<int>? serviceIds;

  @JsonKey(name: 'items')
  final List<OrderItemDto>? items;

  @JsonKey(name: 'conditions')
  final List<OrderConditionDto>? conditions;

  @JsonKey(name: 'flights')
  final List<OrderFlightDto>? flights;

  @JsonKey(name: 'passengers')
  final List<OrderPassengerDto>? passengers;

  @JsonKey(name: 'accompanying_persons')
  final List<OrderAccompanyingPersonDto>? accompanyingPersons;

  @JsonKey(name: 'transfers')
  final List<OrderTransferDto>? transfers;

  @JsonKey(name: 'summary')
  final OrderSummaryDto? summary;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'comment')
  final String? comment;

  @JsonKey(name: 'available_points')
  final double? availablePoints;

  @JsonKey(name: 'max_points_use')
  final double? maxPointsUse;

  @JsonKey(name: 'potential_cashback')
  final double? potentialCashback;

  @JsonKey(name: 'exchange_rate')
  final double? exchangeRate;

  @JsonKey(name: 'user_balance_points')
  final double? userBalancePoints;

  @JsonKey(name: 'user_balance_money')
  final double? userBalanceMoney;

  @JsonKey(name: 'max_points_to_use')
  final double? maxPointsToUse;

  @JsonKey(name: 'max_discount_money')
  final double? maxDiscountMoney;

  @JsonKey(name: 'step')
  final int? step;

  @JsonKey(name: 'selected_services')
  final List<OrderEndpointServicesDto>? selectedServices;

  const OrderDto({
    required this.id,
    this.refNumber,
    this.status,
    this.type,
    this.totalAmount,
    this.currency,
    this.currencySymbol,
    this.paymentDeadline,
    this.contactName,
    this.contactEmail,
    this.contactPhone,
    this.contactDateOfBirth,
    this.adultsCount,
    this.childrenCount,
    this.infantsCount,
    this.hasReducedMobility,
    this.serviceIds,
    this.items,
    this.conditions,
    this.flights,
    this.passengers,
    this.accompanyingPersons,
    this.transfers,
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

  factory OrderDto.fromJson(Map<String, dynamic> json) => _$OrderDtoFromJson(json);
}

List<int>? _serviceIdsFromJson(Object? json) {
  if (json == null) return null;
  if (json is! List) return null;
  final List<int> result = <int>[];
  for (final Object? element in json) {
    if (element == null) continue;
    result.add((element as num).toInt());
  }
  return result;
}
