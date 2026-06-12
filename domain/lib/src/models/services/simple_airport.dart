part of 'services_models.dart';

@immutable
class SimpleAirport {
  final int id;
  final String? iataCode;
  final String name;

  const SimpleAirport({required this.id, this.iataCode, required this.name});
}
