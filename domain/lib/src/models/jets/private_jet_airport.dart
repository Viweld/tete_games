part of 'jets_models.dart';

@immutable
class PrivateJetAirport {
  final int id;
  final String? iataCode;
  final String name;
  final String slug;

  const PrivateJetAirport({
    required this.id,
    this.iataCode,
    required this.name,
    required this.slug,
  });
}
