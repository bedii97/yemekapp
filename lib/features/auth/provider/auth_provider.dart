import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/core/utils/token_manager.dart';
import 'package:yemek_app/core/utils/utils.dart';
import 'package:yemek_app/features/auth/service/auth_service.dart';
import 'package:yemek_app/routes/app_routes.dart';

final authProvider = StateNotifierProvider<AuthProvider, bool>((ref) {
  return AuthProvider(ref.watch(authServiceProvider));
});

class AuthProvider extends StateNotifier<bool> with TokenManager {
  final AuthService _authService;
  AuthProvider(this._authService) : super(false);

  //State isLoading görevi görüyor

  void login(
      {required String username,
      required String password,
      required BuildContext context}) async {
    try {
      state = true;
      await _authService
          .login(username: username, password: password)
          .then((loginResponse) async {
        print(loginResponse!.token);
        print(loginResponse.code);
        print(loginResponse.message);
        if (loginResponse.code == 200) {
          saveToken((loginResponse.token) as String);
          print('Token Saved: ${loginResponse.token}');
          Navigator.pushNamed(context, AppRoutes.homeScreen);
          //pushReplacementNamed
        } else {
          showSnackBar(
            context,
            ((loginResponse.message ?? 'undefined_error')).tr(),
          );
        }
      });
      state = false;
    } catch (e) {
      state = false;
    }
  }

  void register(
      {required String username,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      state = true;
      await _authService
          .register(username: username, email: email, password: password)
          .then((value) {
        if (value) {
          Navigator.pushNamed(context, AppRoutes.homeScreen);
        } else {}
        //pushReplacementNamed
      });
      state = false;
    } catch (e) {
      state = false;
    }
  }

  void logout(BuildContext context) {
    deleteToken();
    Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
  }
}
