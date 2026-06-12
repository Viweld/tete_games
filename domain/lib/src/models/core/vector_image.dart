part of 'core_models.dart';

/// A class representing a vector image with multiple size variants.
@immutable
class VectorImage {
  /// URL to the original vector image.
  final String original;

  /// URL to the large-sized vector image.
  final String large;

  /// URL to the medium-sized vector image.
  final String medium;

  /// URL to the small-sized vector image.
  final String small;

  const VectorImage({
    required this.original,
    required this.large,
    required this.medium,
    required this.small,
  });
}
