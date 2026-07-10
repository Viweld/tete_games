import 'dart:async';

import 'package:core/src/events/app_toast_bus.dart';
import 'package:core/src/events/app_toast_events.dart';
import 'package:core/src/events/app_toast_messenger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppToastMessenger', () {
    late AppToastBus bus;
    late AppToastMessenger messenger;

    setUp(() {
      bus = AppToastBus();
      messenger = AppToastMessenger(bus);
    });

    tearDown(() => bus.dispose());

    test('show publishes custom toast event', () async {
      const AppToastEvent event = AppToastEvent.info('hello');

      final Future<AppToastEvent> next = bus.stream.first;
      messenger.show(event);

      expect(await next, event);
    });

    test('shortcut helpers publish typed events', () async {
      final List<AppToastEvent> events = <AppToastEvent>[];
      final StreamSubscription<AppToastEvent> subscription = bus.stream.listen(events.add);

      messenger.showError('boom');
      messenger.showSuccess('ok');
      messenger.showWarning('careful');
      messenger.showInfo('note');
      await Future<void>.delayed(Duration.zero);
      await Future<void>.delayed(Duration.zero);

      expect(events.length, 4);
      expect(events[0], isA<ErrorToastEvent>());
      expect((events[0] as ErrorToastEvent).message, 'boom');
      expect(events[1], isA<SuccessToastEvent>());
      expect(events[2], isA<WarningToastEvent>());
      expect(events[3], isA<InfoToastEvent>());

      await subscription.cancel();
    });
  });
}
