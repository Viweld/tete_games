import 'package:core/src/services/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static FirebaseOptions get firebaseOptions => DefaultFirebaseOptions.currentPlatform;
}
