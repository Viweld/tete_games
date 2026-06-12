part of 'core_models.dart';

/// This enum defines the authentication states for the application.
@immutable
sealed class AuthenticationState {
  const AuthenticationState();
}

class Authenticated extends AuthenticationState {
  final bool isNewUser;

  const Authenticated({required this.isNewUser});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Authenticated && runtimeType == other.runtimeType && isNewUser == other.isNewUser;

  @override
  int get hashCode => isNewUser.hashCode;
}

class NotAuthenticated extends AuthenticationState {
  const NotAuthenticated();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NotAuthenticated && runtimeType == other.runtimeType;

  @override
  int get hashCode => runtimeType.hashCode;
}
