import '../../../domain.dart';

class SignUpUseCase implements FutureUseCase<UserModel, void> {
  SignUpUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<String> execute(UserModel userModel) {
    return _authenticationRepository.signUp(userModel);
  }
}
