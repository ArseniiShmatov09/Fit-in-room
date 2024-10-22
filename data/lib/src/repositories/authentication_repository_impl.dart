import 'package:domain/domain.dart';

import '../mappers/user_mapper.dart';
import '../providers/authentication_provider.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required AuthenticationProvider apiProvider,
    required UserMapper userMapper,
  })  : _apiProvider = apiProvider,
        _userMapper = userMapper;

  final AuthenticationProvider _apiProvider;
  final UserMapper _userMapper;

  @override
  Future<String> logout(UserModel userModel) {
    return _apiProvider.logout(_userMapper.toData(userModel).toJson());
  }

  @override
  Future<String> signIn(UserModel userModel) {
    return _apiProvider.signIn(_userMapper.toData(userModel).toJson());
  }

  @override
  Future<String> signUp(UserModel userModel) {
    return _apiProvider.signUp(_userMapper.toData(userModel).toJson());
  }
}
