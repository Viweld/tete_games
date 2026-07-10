import 'package:flutter_test/flutter_test.dart';
import 'package:shell/src/presentation/home_screen/models/home_overlay_projection.dart';

void main() {
  group('HomeOverlayProjection', () {
    test('copyWith updates highlighted device id', () {
      const HomeOverlayProjection projection = HomeOverlayProjection();

      final HomeOverlayProjection updated = projection.copyWith(highlightedDeviceId: 'device-1');

      expect(updated.highlightedDeviceId, 'device-1');
      expect(projection.highlightedDeviceId, isNull);
    });

    test('copyWith clearHighlight removes highlight', () {
      const HomeOverlayProjection projection = HomeOverlayProjection(
        highlightedDeviceId: 'device-1',
      );

      final HomeOverlayProjection cleared = projection.copyWith(clearHighlight: true);

      expect(cleared.highlightedDeviceId, isNull);
    });

    test('equality compares highlighted device id', () {
      const HomeOverlayProjection first = HomeOverlayProjection(highlightedDeviceId: 'device-1');
      const HomeOverlayProjection second = HomeOverlayProjection(highlightedDeviceId: 'device-1');
      const HomeOverlayProjection third = HomeOverlayProjection(highlightedDeviceId: 'device-2');

      expect(first, second);
      expect(first == third, isFalse);
    });
  });
}
