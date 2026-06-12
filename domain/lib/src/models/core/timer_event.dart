part of 'core_models.dart';

/// Event when timer triggers
@immutable
class TimerEvent {
  final String timerKey;
  final int? timesLeft;

  const TimerEvent({required this.timerKey, required this.timesLeft});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimerEvent && other.timerKey == timerKey && other.timesLeft == timesLeft;
  }

  @override
  int get hashCode => timerKey.hashCode ^ timesLeft.hashCode;
}
