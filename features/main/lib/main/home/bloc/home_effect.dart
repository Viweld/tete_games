part of 'home_bloc.dart';

@freezed
sealed class HomeEffect with _$HomeEffect {
  const factory HomeEffect.navigateBack() = NavigateBackEffect;
}
