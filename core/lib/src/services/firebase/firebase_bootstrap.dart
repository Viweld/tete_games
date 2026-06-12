import 'dart:developer' as developer;

import 'package:core/src/services/firebase/firebase_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Initializes Firebase Core and Crashlytics. Call from main() before runApp().
abstract final class FirebaseBootstrap {
  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp(options: FirebaseConfig.firebaseOptions);

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
}
