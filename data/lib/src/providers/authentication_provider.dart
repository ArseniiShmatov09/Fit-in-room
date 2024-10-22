abstract class AuthenticationProvider {
  Future<String> signIn(Map<String, dynamic> userData);

  Future<String> signUp(Map<String, dynamic> userData);

  Future<String> logout(Map<String, dynamic> userData);
}
