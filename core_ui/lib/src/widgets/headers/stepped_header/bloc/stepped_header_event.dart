part of 'stepped_header_bloc.dart';

@freezed
sealed class SteppedHeaderEvent with _$SteppedHeaderEvent {
  const factory SteppedHeaderEvent.authStatusChanged(AuthenticationState authState) =
      _AuthStatusChanged;
}
