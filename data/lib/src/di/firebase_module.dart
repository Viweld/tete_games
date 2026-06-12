import 'package:core/core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

@module
abstract class FirebasePackageModule {
  @lazySingleton
  FirebaseMessaging firebaseMessaging() => FirebaseMessaging.instance;
}
