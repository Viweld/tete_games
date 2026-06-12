part of 'stepped_header_bloc.dart';

@freezed
abstract class SteppedHeaderState with _$SteppedHeaderState {
  const factory SteppedHeaderState({required bool isAuthenticated}) = _SteppedHeaderState;
}
