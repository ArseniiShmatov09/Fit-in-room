import 'package:core/core.dart';

import 'authentication_provider.dart';

class AuthenticationProviderImpl implements AuthenticationProvider {
  final Dio dio;

  AuthenticationProviderImpl({required this.dio});

  @override
  Future<String> logout(Map<String, dynamic> userData) async {
    try {
      final Response<Map<String, dynamic>> response = await dio.post(
        'http://10.201.32.220:8080/logout',
        data: userData,
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        return 'Unexpected error occurred: ${response.statusCode}';
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 400) {
        throw e.response?.data;
      } else {
        return 'Error: ${e.message}';
      }
    }
  }

  @override
  Future<String> signIn(Map<String, dynamic> userData) async {
    try {
      final Response<String> response = await dio.post(
        'http://10.201.32.220:8080/auth',
        data: userData,
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        return 'Unexpected error occurred: ${response.statusCode}';
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 400) {
        throw e.response?.data;
      } else {
        return 'Error: ${e.message}';
      }
    }
  }

  @override
  Future<String> signUp(Map<String, dynamic> userData) async {
    try {
      final Response<String> response = await dio.post(
        'http://10.201.32.220:8080/signUp',
        data: userData,
      );
      if (response.statusCode == 200) {
        return response.data.toString();
      } else {
        return 'Unexpected error occurred: ${response.statusCode}';
      }
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 400) {
        throw e.response?.data;
      } else {
        return 'Error: ${e.message}';
      }
    }
  }
}
