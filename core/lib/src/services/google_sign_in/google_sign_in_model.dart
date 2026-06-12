/// Model containing the results of a Google Sign-In.
class GoogleSignInModel {
  final String token;
  final String firstName;
  final String lastName;

  const GoogleSignInModel({required this.token, required this.firstName, required this.lastName});
}
