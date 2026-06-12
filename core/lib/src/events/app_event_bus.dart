import 'dart:async';

import 'package:core/src/events/app_events.dart';
import 'package:injectable/injectable.dart';

class AppEventBus {
  final StreamController<AppEvent> _controller = StreamController<AppEvent>.broadcast();

  Stream<AppEvent> get stream => _controller.stream;

  void fire(AppEvent event) {
    _controller.add(event);
  }

  @disposeMethod
  void dispose() {
    _controller.close();
  }
}
