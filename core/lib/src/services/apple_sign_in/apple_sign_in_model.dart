final class AppleSignInModel {
  final String token;
  final String firstName;
  final String lastName;
  final String clientId;

  const AppleSignInModel({
    required this.token,
    required this.firstName,
    required this.lastName,
    required this.clientId,
  });
}
