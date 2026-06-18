part of 'home_app_bar_bloc.dart';

@freezed
abstract class HomeAppBarState with _$HomeAppBarState {
  const factory HomeAppBarState({
    String? localDisplayName,
    String? remoteDisplayName,
    @Default(false) bool isConnected,
  }) = _HomeAppBarState;
}
