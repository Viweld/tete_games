part of 'connection_section_bloc.dart';

@freezed
abstract class ConnectionSectionState with _$ConnectionSectionState {
  const factory ConnectionSectionState({
    @Default(false) bool arePermissionsGranted,
    @Default(false) bool isAdapterEnabled,
    @Default(false) bool isConnected,
    ConnectionSectionEffect? effect,
  }) = _ConnectionSectionState;
}
