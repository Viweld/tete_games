part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    String? error,
    HomeEffect? effect,
  }) = _HomeState;
}
