import 'dart:ui' show Color;

import 'package:flutter/animation.dart' show Color;
import 'package:flutter/cupertino.dart' show Color;
import 'package:flutter/material.dart' show Color;
import 'package:flutter/painting.dart' show Color;
import 'package:flutter/rendering.dart' show Color;
import 'package:flutter/services.dart' show Color;
import 'package:flutter/widgets.dart' show Color;

/// Utility class for generating deterministic colors from strings.
///
/// `ColorUtils` provides methods to convert any string into a unique
/// but consistent [Color] or hexadecimal representation. Useful for
/// generating avatar background colors, category tags, or other
/// visual identifiers based on text.
///
/// Example:
/// ```dart
/// final Color color = ColorUtils.stringToColor('Flutter');
/// final String hex = ColorUtils.stringToHexColor('Flutter');
/// ```
class ColorUtils {
  /// Private constructor to prevent instantiation.
  ColorUtils._();

  /// Computes a simple deterministic hash code for a given [String].
  ///
  /// This function iterates through all Unicode runes of the string and
  /// accumulates a hash value. The algorithm is similar to DJB2 hashing
  /// and ensures that small input differences yield different outputs.
  ///
  /// Returns an integer hash which is later used to generate a color value.
  static int _hash(String value) {
    int hash = 0;

    value.runes.forEach((int code) => hash = code + ((hash << 5) - hash));

    return hash;
  }

  /// Converts a [String] to a [Color] instance.
  ///
  /// Internally, it uses [_hash] to compute a unique numeric representation
  /// and then maps it to an ARGB color value.
  ///
  /// Example:
  /// ```dart
  /// final color = ColorUtils.stringToColor('example');
  /// ```
  static Color stringToColor(String value) => Color(stringToHexInt(value));

  /// Converts a [String] to its hexadecimal color code representation.
  ///
  /// Returns a string in the format `'0xFFXXXXXX'`, where `XXXXXX`
  /// represents the RGB components derived from the input string.
  ///
  /// Example:
  /// ```dart
  /// final hexColor = ColorUtils.stringToHexColor('user123'); // e.g. "0xFF92A4BC"
  /// ```
  static String stringToHexColor(String value) {
    final String c = (_hash(value) & 0x00FFFFFF).toRadixString(16).toUpperCase();

    final String result = '0xFF00000'.substring(0, 10 - c.length) + c;

    return result;
  }

  /// Converts a [String] to an integer color value.
  ///
  /// Returns an ARGB integer (e.g. `0xFF92A4BC`) that can be passed directly
  /// to the [Color] constructor.
  ///
  /// Example:
  /// ```dart
  /// final int colorInt = ColorUtils.stringToHexInt('category');
  /// final Color color = Color(colorInt);
  /// ```
  static int stringToHexInt(String value) {
    final String c = (_hash(value) & 0x00FFFFFF).toRadixString(16).toUpperCase();

    final String hex = 'FF00000'.substring(0, 8 - c.length) + c;

    final int result = int.parse(hex, radix: 16);

    return result;
  }
}
