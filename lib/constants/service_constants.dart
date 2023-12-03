class ServiceConstants {
  // static const baseUrl = 'https://yemekapp.onrender.com';
  static const baseUrl = 'http://31.223.6.113:8080';
  // static const baseUrl = 'http://192.168.31.86:8080';
  static const _api = '/api';
  static const register = '$_api/register';
  static const login = '$_api/login';
  static const post = '$_api/post';
  static const getPost = '$_api/homepage';
  static const users = '$_api/users';
  static const connectTimeout = Duration(seconds: 10);
  static const receiveTimeout = Duration(seconds: 10);
}
