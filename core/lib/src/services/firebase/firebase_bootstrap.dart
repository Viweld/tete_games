import 'dart:developer' as developer;

import 'package:core/src/services/firebase/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Initializes Firebase Core and Crashlytics. Call from main() before runApp().
abstract final class FirebaseBootstrap {
  static Future<void> initialize() async {
    try {
      await _ensureDefaultApp();

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
    } on Object catch (error, stackTrace) {
      developer.log(
        'Firebase bootstrap skipped or failed',
        name: 'FirebaseBootstrap',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  /// Ensures the default Firebase app exists for Dart plugins.
  ///
  /// On Android, [google-services] may auto-initialize Firebase natively before
  /// Dart runs while [Firebase.apps] is still empty — handle [duplicate-app].
  static Future<FirebaseApp> _ensureDefaultApp() async {
    if (Firebase.apps.isNotEmpty) {
      return Firebase.app();
    }

    try {
      return await Firebase.initializeApp(options: FirebaseConfig.firebaseOptions);
    } on FirebaseException catch (error) {
      if (error.code == 'duplicate-app') {
        return Firebase.app();
      }
      rethrow;
    }
  }
}
