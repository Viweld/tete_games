part of 'home_bloc.dart';

enum HomePhase { initializing, ready, connected }

enum HomeErrorKind { initializationFailed }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    required HomePhase phase,
    @Default(false) bool isLoading,
    HomeErrorKind? errorKind,
    HomeEffect? effect,
  }) = _HomeState;
}
