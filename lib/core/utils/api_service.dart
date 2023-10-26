import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/constants/service_constants.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = ServiceConstants.baseUrl;
  dio.options.connectTimeout = ServiceConstants.connectTimeout;
  dio.options.receiveTimeout = ServiceConstants.receiveTimeout;
  return dio;
});

class ApiService {
  ApiService._();
}
