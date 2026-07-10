import 'package:flutter_test/flutter_test.dart';
import 'package:infrastructure/src/peer/ble_peer_session_guard_impl.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('BlePeerSessionGuardImpl', () {
    late BlePeerSessionGuardImpl guard;

    setUp(() {
      guard = BlePeerSessionGuardImpl();
    });

    test('activate completes without throwing', () async {
      await expectLater(guard.activate(), completes);
    });

    test('deactivate completes without throwing', () async {
      await expectLater(guard.deactivate(), completes);
    });
  });
}
