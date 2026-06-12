import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

/// Utilities for managing the native splash screen.
abstract final class NativeSplashService {
  /// Preserves the native splash screen until [removeSplash] is called.
  static void preserveSplash(WidgetsBinding widgetsBinding) =>
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Removes the native splash screen.
  static void removeSplash() => FlutterNativeSplash.remove();
}
