part of 'splash_bloc.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState.notInitialized({SplashEffect? effect}) = _SplashStateNotInitialized;

  const factory SplashState.initialized({SplashEffect? effect}) = _SplashStateInitialized;
}
