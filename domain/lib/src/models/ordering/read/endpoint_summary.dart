part of 'ordering_read_models.dart';

@immutable
class EndpointSummary {
  final EndpointType type;
  final String airportName;
  final String airportIataCode;
  final String terminalName;
  final String country;
  final String city;
  final List<SummaryItem> servicesBreakdown;
  final OrderTransfer? transfer;

  const EndpointSummary({
    required this.type,
    required this.airportName,
    required this.airportIataCode,
    required this.terminalName,
    required this.country,
    required this.city,
    required this.servicesBreakdown,
    required this.transfer,
  });
}
