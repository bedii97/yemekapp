import 'package:shared_preferences/shared_preferences.dart';

mixin TokenManager {
  Future<bool> isToken() async {
    // return _sharedPreferences.getString('token') != null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token') != null;
  }

  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  Future<void> saveToken(String token) async {
    // return _sharedPreferences.setString('token', token);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
  }

  Future<void> deleteToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
  }
}
