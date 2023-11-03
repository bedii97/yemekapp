class ServiceConstants {
  static const baseUrl = 'https://yemekapp.onrender.com';
  // static const baseUrl = 'http://192.168.1.111:8080';
  static const _api = '/api';
  static const register = '$_api/register';
  static const login = '$_api/login';
  static const post = '$_api/post';
  static const users = '$_api/users';
  static const connectTimeout = Duration(seconds: 3);
  static const receiveTimeout = Duration(seconds: 3);
}
