import 'package:firebase_core/firebase_core.dart';
import 'package:infrastructure/src/firebase/firebase_options.dart';

class FirebaseConfig {
  static FirebaseOptions get firebaseOptions => DefaultFirebaseOptions.currentPlatform;
}
