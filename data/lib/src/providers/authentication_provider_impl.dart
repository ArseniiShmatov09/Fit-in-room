import 'package:core/core.dart';

import 'authentication_provider.dart';

class AuthenticationProviderImpl implements AuthenticationProvider {
  final Dio dio;

  AuthenticationProviderImpl({required this.dio});

  @override
  Future<String> logout(Map<String, dynamic> userData) async {
    final Response<Map<String, dynamic>> response = await dio.post(
      'http://localhost:8080/logout',
      data: userData,
    );
    return response.data! as String;
  }

  @override
  Future<String> signIn(Map<String, dynamic> userData) async {
    final Response<Map<String, dynamic>> response = await dio.post(
      'http://localhost:8080/auth',
      data: userData,
    );
    return response.data! as String;
  }

  @override
  Future<String> signUp(Map<String, dynamic> userData) async {
    final Response<Map<String, dynamic>> response = await dio.post(
      'http://localhost:8080/signUp',
      data: userData,
    );
    return response.data! as String;
  }
}
