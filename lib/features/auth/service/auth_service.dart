// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/constants/service_constants.dart';
import 'package:yemek_app/core/utils/api_service.dart';
import 'package:yemek_app/models/base_response.dart';
import 'package:yemek_app/models/login_response.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.watch(dioProvider));
});

class AuthService {
  final Dio _dio;
  bool isLoggedIn = false;
  AuthService(this._dio);

  Future<LoginResponse?> login(
      {required String username, required String password}) async {
    try {
      final response = await _dio.post(ServiceConstants.login, data: {
        'username': username,
        'password': password,
      });
      var loginResponse = LoginResponse.fromJson(response.data);
      if (loginResponse.code == 200) {
        return loginResponse;
      } else {
        print('Girdi');
        // isLoggedIn = false;
        return loginResponse;
      }
    } on DioException catch (e) {
      // isLoggedIn = false;
      if (e.response != null) {
        return LoginResponse.fromJson(e.response!.data);
      }
      return null;
    }
  }

  Future<bool> register(
      {required String username,
      required String password,
      required String email}) async {
    try {
      final response = await _dio.post(ServiceConstants.register, data: {
        'username': username,
        'email': email,
        'password': password,
      });

      BaseResponse response2 = BaseResponse.fromJson(response.data);
      if (response2.code == 200) {
        // Giriş başarılı, kullanıcı bilgilerini UserModel'e kaydedebilirsiniz.
        isLoggedIn = true;
      } else {
        isLoggedIn = false;
      }
    } catch (error) {
      isLoggedIn = false;
    }
    return isLoggedIn;
  }

  void logout() {
    isLoggedIn = false;
  }
}
