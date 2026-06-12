import 'package:flutter/foundation.dart';

/// Deep-link style navigation triggered by an FCM data payload.
@immutable
class PushNavigationEvent {
  const PushNavigationEvent({this.route, this.params = const <String, String>{}});

  final String? route;
  final Map<String, String> params;
}
