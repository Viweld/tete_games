import 'dart:async';

import 'package:core/src/events/app_toast_events.dart';
import 'package:injectable/injectable.dart';

class AppToastBus {
  final StreamController<AppToastEvent> _controller = StreamController<AppToastEvent>.broadcast();

  Stream<AppToastEvent> get stream => _controller.stream;

  void fire(AppToastEvent event) {
    _controller.add(event);
  }

  @disposeMethod
  void dispose() {
    _controller.close();
  }
}
