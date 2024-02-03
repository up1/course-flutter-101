import 'package:day02/models/user_response.dart';
import 'package:dio/dio.dart';

class UserService {
  Dio _dio = Dio();

  Future<UserResponse> loginUser(String username, String password) async {
    try {
      BaseOptions options = BaseOptions(
        baseUrl: "https://dummyjson.com",
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
      );
      _dio = Dio(options);
      final response = await _dio.post(
        "/auth/login",
        data: {
          'username': 'kminchelle',
          'password': '0lelplR',
        },
      );

      if (response.statusCode == 200) {
        return UserResponse.fromJson(response.data);
      } else if (response.statusCode == 400) {
        throw Exception('Bad request');
      } else if (response.statusCode == 500) {
        throw Exception('Server error');
      } else {
        throw Exception('Unexpected error occurred');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
