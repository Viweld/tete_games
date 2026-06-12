import 'package:core/core.dart';
import 'package:core/src/services/firebase/firebase_options_dev.dart' as dev;
import 'package:core/src/services/firebase/firebase_options_prod.dart' as prod;
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static FirebaseOptions getFirebaseOptionsFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
      case Flavor.devMock:
        throw UnimplementedError();
    }
  }
}
