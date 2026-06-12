part of 'client_session_bloc.dart';

@freezed
sealed class ClientSessionEffect with _$ClientSessionEffect {
  const factory ClientSessionEffect.closeDialog() = ClientSessionCloseDialogEffect;
}
