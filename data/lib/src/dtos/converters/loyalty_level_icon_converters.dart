/// Reads loyalty icon URLs from profile (`icon_color`) or legacy (`icon_color_url`) keys.
abstract final class LoyaltyLevelIconConverters {
  static Object? readIconColor(Map<dynamic, dynamic> json, String key) =>
      json['icon_color'] ?? json['icon_color_url'];

  static Object? readIconMono(Map<dynamic, dynamic> json, String key) =>
      json['icon_mono'] ?? json['icon_mono_url'];
}
