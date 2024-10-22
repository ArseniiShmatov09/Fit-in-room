import '../../../domain.dart';

class SignInUseCase implements FutureUseCase<UserModel, void> {
  SignInUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<String> execute(UserModel userModel) {
    return _authenticationRepository.signIn(userModel);
  }
}