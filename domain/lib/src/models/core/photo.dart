part of 'core_models.dart';

/// A class representing a photo with multiple size variants.
@immutable
class Photo {
  /// URL to the original photo.
  final String original;

  /// URL to the large-sized photo.
  final String large;

  /// URL to the medium-sized photo.
  final String medium;

  /// URL to the small-sized photo.
  final String small;

  const Photo({
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
  });
}
