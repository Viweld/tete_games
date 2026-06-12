import 'package:flutter/foundation.dart';

@immutable
sealed class AppEvent {
  const AppEvent();

  const factory AppEvent.refreshData() = RefreshDataEvent;
}

class RefreshDataEvent extends AppEvent {
  const RefreshDataEvent();
}
