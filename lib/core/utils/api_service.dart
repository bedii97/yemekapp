import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/constants/service_constants.dart';
import 'package:yemek_app/core/utils/token_manager.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = ServiceConstants.baseUrl;
  dio.options.connectTimeout = ServiceConstants.connectTimeout;
  dio.options.receiveTimeout = ServiceConstants.receiveTimeout;
  // final sharedPreferences = ref.read(sharedPreferencesProvider);
  // late final String? token;
  // sharedPreferences.then((value) => token = value.getString('token'));
  // if (token != null) {
  //   dio.options.headers['token'] = token;
  // }
  return dio;
});

class ApiService {
  ApiService._();
}
