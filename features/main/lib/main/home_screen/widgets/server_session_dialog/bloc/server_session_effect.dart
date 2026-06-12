part of 'server_session_bloc.dart';

@freezed
sealed class ServerSessionEffect with _$ServerSessionEffect {
  const factory ServerSessionEffect.closeDialog() = ServerSessionCloseDialogEffect;
}
