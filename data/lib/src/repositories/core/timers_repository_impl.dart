part of '../repositories.dart';

/// repository for timers
@LazySingleton(as: TimersRepository)
class TimersRepositoryImpl implements TimersRepository {
  final LocalDataProvider _localCacheDataProvider;

  /// active timers. timerKey => Timer.periodic
  late Map<String, Timer> _timers;

  /// remaining seconds counters. timerKey => secondsLeft
  late Map<String, int> _counters;

  /// stream controllers for each timer type
  late Map<String, StreamController<TimerEvent>> _streamControllers;

  /// List of timer keys being worked with.
  late Set<String> _registeredTimersKey;

  TimersRepositoryImpl({required LocalDataProvider localCacheDataProvider})
    : _localCacheDataProvider = localCacheDataProvider {
    _registeredTimersKey = <String>{};
    _timers = <String, Timer>{};
    _counters = <String, int>{};
    _streamControllers = <String, StreamController<TimerEvent>>{};
  }

  /// Stream with timer changes
  @override
  Stream<TimerEvent> listenTo(String timerKey) => _streamControllers[timerKey]!.stream;

  /// remaining seconds of a specific timer
  @override
  int? getTimerCounter(String timerKey) => _counters[timerKey];

  /// registration of timers
  @override
  void registerTimersKey(List<String> keys) {
    _registeredTimersKey.addAll(keys);
    for (final String key in keys) {
      if (_streamControllers.containsKey(key)) continue;
      _streamControllers[key] = StreamController<TimerEvent>.broadcast();
    }
  }

  /// start timer
  /// returns the number of seconds the timer will be initiated with
  @override
  int startTimer({required String timerKey, required int timeoutInSeconds, DateTime? currentTime}) {
    // remove timer information
    _timers[timerKey]?.cancel();
    _timers.remove(timerKey);
    _counters.remove(timerKey);

    // calculate end time
    final DateTime endTime = (currentTime ?? DateTime.now()).add(
      Duration(seconds: timeoutInSeconds),
    );

    // save in cache
    _localCacheDataProvider.setValue(
      key: _buildTimerCacheKey(timerKey),
      value: endTime.millisecondsSinceEpoch,
    );

    // start timer
    _addTimer(timerKey, timeoutInSeconds);

    // notify subscribers immediately
    _addEvent(timerKey, timeoutInSeconds);

    return timeoutInSeconds;
  }

  /// generation of key under which timer value will be stored in cache
  String _buildTimerCacheKey(String timerKey) => 'global_timer_$timerKey';

  /// close repository, close streams
  @override
  void close() =>
      _streamControllers.values.forEach((StreamController<TimerEvent> sc) => sc.close());

  @override
  void restoreTimers() => _registeredTimersKey.forEach(_validateTimer);

  Future<DateTime?> _readCachedTimerEnd(String timerKey) async {
    final Object? valueRaw = await _localCacheDataProvider.getValue(
      key: _buildTimerCacheKey(timerKey),
    );
    final int? millisecondsSinceEpoch = int.tryParse('$valueRaw');
    return millisecondsSinceEpoch == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  /// deletes all data about this timer type from memory and re-initiates it
  /// based on endDateTime from cache
  Future<void> _validateTimer(String timerKey, {DateTime? currentDateTime}) async {
    // remove timer information
    _timers[timerKey]?.cancel();
    _timers.remove(timerKey);
    _counters.remove(timerKey);

    final DateTime? endDateTime = await _readCachedTimerEnd(timerKey);

    // such timer not found in cache
    if (endDateTime == null) {
      _addEvent(timerKey, null);
    } else {
      // timer found, but it is already expired
      if ((currentDateTime ?? DateTime.now()).isAfter(endDateTime)) {
        await _localCacheDataProvider.deleteValue(key: timerKey);
        _addEvent(timerKey, null);
      } else {
        // active timer found
        final int inSeconds = endDateTime.difference(currentDateTime ?? DateTime.now()).inSeconds;
        _addTimer(timerKey, inSeconds);
      }
    }
  }

  void _addTimer(String timerKey, int timeoutInSeconds) {
    _counters[timerKey] = timeoutInSeconds;

    // add timer
    _timers[timerKey]?.cancel();
    _timers[timerKey] = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      // decrease seconds
      if (_counters.containsKey(timerKey)) {
        _counters[timerKey] = _counters[timerKey]! - 1;
      }
      // if count ended
      if (!_counters.containsKey(timerKey) || _counters[timerKey]! <= 0) {
        await _localCacheDataProvider.deleteValue(key: timerKey);
        timer.cancel();
        _timers.remove(timerKey);
        _counters.remove(timerKey);
        _addEvent(timerKey, null);
      } else {
        _addEvent(timerKey, _counters[timerKey]);
      }
    });
  }

  void _addEvent(String timerKey, int? value) {
    if (_streamControllers[timerKey]?.isClosed ?? true) return;

    _streamControllers[timerKey]!.add(TimerEvent(timerKey: timerKey, timesLeft: value));
  }
}
