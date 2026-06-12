part of 'repositories.dart';

/// repository for global timers
abstract class TimersRepository {
  /// registration of timers to work with.
  /// Must be called before [restoreTimers] method
  void registerTimersKey(List<String> keys);

  /// remaining timer seconds
  int? getTimerCounter(String timerKey);

  /// start timer
  /// returns the number of seconds the timer will be initiated with
  int startTimer({required String timerKey, required int timeoutInSeconds, DateTime? currentTime});

  /// Reads the timeout start date from cache and updates the value
  /// of remaining time. Relevant on iPhones after changing the app's
  /// operation state.
  /// To work, you must first register timer keys
  /// using the [registerTimersKey] method
  void restoreTimers();

  /// close repository, close streams
  void close();

  /// Stream with timer changes
  Stream<TimerEvent> listenTo(String timerKey);
}
