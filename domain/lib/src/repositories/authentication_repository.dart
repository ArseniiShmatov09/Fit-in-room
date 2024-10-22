import '../../domain.dart';

abstract class AuthenticationRepository {
  Future<String> signIn(UserModel userModel);

  Future<String> signUp(UserModel userModel);

  Future<String> logout(UserModel userModel);
}
