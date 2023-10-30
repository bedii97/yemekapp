// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/constants/service_constants.dart';
import 'package:yemek_app/core/utils/api_service.dart';
import 'package:yemek_app/core/utils/connection_checker.dart';
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
    print('SERVICE LOGIN IÇINDE');
    try {
      print('SERVICE TRY IÇINDE');
      bool isConnected = await ConnectionChecker.checkConnection2();
      if (!isConnected) return null;
      final response = await _dio.post(ServiceConstants.login, data: {
        'username': username,
        'password': password,
      });
      print('SERVICE DIO BITTI IÇINDE');
      var loginResponse = LoginResponse.fromJson(response.data);
      if (loginResponse.code == 200) {
        print('SERVICE IF IÇINDE');
        return loginResponse;
      } else {
        // isLoggedIn = false;
        print('SERVICE ELSE IÇINDE');
        return loginResponse;
      }
    } on DioException catch (e) {
      print('SERVICE DIOEXCEPTION IÇINDE');
      if (e.response != null) {
        print(e.response!.data);
      } else {
        print('SERVICE ELSE IÇINDE');
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions);
        print(e.message);
      }

      // isLoggedIn = false;
      if (e.response != null) {
        return LoginResponse.fromJson(e.response!.data);
      }
      return null;
    } catch (e) {
      print('SERVICE CATCH IÇINDE');
      print(e);
    }
    return null;
  }

  Future<BaseResponse?> register(
      {required String username,
      required String password,
      required String email}) async {
    BaseResponse response2;
    try {
      bool isConnected = await ConnectionChecker.checkConnection2();
      if (!isConnected) return null;
      final response = await _dio.post(ServiceConstants.register, data: {
        'username': username,
        'email': email,
        'password': password,
      });

      response2 = BaseResponse.fromJson(response.data);
      if (response2.code == 200) {
        // Giriş başarılı, kullanıcı bilgilerini UserModel'e kaydedebilirsiniz.
        return response2;
      } else {
        response2;
      }
    } catch (error) {
      return BaseResponse(code: 400, message: error.toString());
    }
    return response2;
  }

  void logout() {
    isLoggedIn = false;
  }
}
