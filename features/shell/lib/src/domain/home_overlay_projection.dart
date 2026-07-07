import 'package:flutter/foundation.dart';

@immutable
final class HomeOverlayProjection {
  const HomeOverlayProjection({this.highlightedDeviceId});

  final String? highlightedDeviceId;

  HomeOverlayProjection copyWith({String? highlightedDeviceId, bool clearHighlight = false}) {
    return HomeOverlayProjection(
      highlightedDeviceId: clearHighlight
          ? null
          : (highlightedDeviceId ?? this.highlightedDeviceId),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is HomeOverlayProjection && other.highlightedDeviceId == highlightedDeviceId;
  }

  @override
  int get hashCode => highlightedDeviceId.hashCode;
}
