import 'package:flutter/foundation.dart';

@immutable
final class FrameProjectionInput {
  const FrameProjectionInput({this.highlightedDeviceId});

  final String? highlightedDeviceId;

  FrameProjectionInput copyWith({String? highlightedDeviceId, bool clearHighlight = false}) {
    return FrameProjectionInput(
      highlightedDeviceId: clearHighlight
          ? null
          : (highlightedDeviceId ?? this.highlightedDeviceId),
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is FrameProjectionInput && other.highlightedDeviceId == highlightedDeviceId;
  }

  @override
  int get hashCode => highlightedDeviceId.hashCode;
}
