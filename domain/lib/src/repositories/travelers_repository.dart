part of 'repositories.dart';

abstract interface class TravelersRepository {
  /// Fetches the list of all travelers.
  Future<List<Traveler>> getTravelers();

  /// Adds a new traveler and returns the updated one.
  Future<Traveler> createTraveler({required CreateTravelerRequest request});

  /// Fetches detailed information about a specific traveler by ID.
  Future<Traveler> getTraveler({required int id});

  /// Updates specific fields of a traveler.
  Future<Traveler> updateTraveler({required int id, required UpdateTravelerRequest request});

  /// Fully replaces a traveler's data.
  Future<Traveler> replaceTraveler({required int id, required CreateTravelerRequest request});

  /// Permanently removes a traveler from the user's list.
  Future<void> deleteTraveler({required int id});
}
