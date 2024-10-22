import '../../../domain.dart';

class LogoutUseCase implements FutureUseCase<UserModel, void> {
  LogoutUseCase({
    required AuthenticationRepository authenticationRepository,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Future<String> execute(UserModel userModel) {
    return _authenticationRepository.logout(userModel);
  }
}