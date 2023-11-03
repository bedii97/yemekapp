import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/constants/server_errors.dart';
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
    print('PROVIDER LOGIN IÇINDE');
    try {
      print('PROVIDER TRY IÇINDE');
      state = true;
      await _authService
          .login(username: username, password: password)
          .then((loginResponse) async {
        print(loginResponse?.code);
        if ((loginResponse?.code) is int && loginResponse?.code == 200) {
          print('PROVIDER IF IÇINDE');
          state = false;
          saveToken((loginResponse?.token) as String);
          print('Token Saved: ${loginResponse?.token}');
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.homeScreen,
            (route) => false,
          );
          //pushReplacementNamed
        } else {
          print('PROVIDER ELSE IÇINDE');
          state = false;
          showSnackBar(
            context,
            (ServerErrors.errors.containsValue(loginResponse?.message)
                    ? loginResponse?.message
                    : 'undefined_error')!
                .tr(),
          );
        }
      }).onError(
        (error, stackTrace) {
          print('PROVIDER ONERROR IÇINDE');
          state = false;
          print(error);
          print(stackTrace);
        },
      );
      state = false;
    } on DioException catch (e) {
      print('PROVIDER DIOERROR IÇINDE');
      state = false;
      print(e);
    } catch (e) {
      print('PROVIDER CATCH IÇINDE');
      print(e);
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
          .then((baseResponse) {
        if (baseResponse?.code == 200) {
          // Navigator.pushNamed(context, AppRoutes.homeScreen);
          showSnackBar(context, 'registration_check_email'.tr());
          Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.signInScreen,
            (route) => false,
          );
        } else {
          showSnackBar(
              context,
              (ServerErrors.errors.containsValue(baseResponse?.message)
                      ? baseResponse?.message
                      : 'undefined_error')!
                  .tr());
        }
        //pushReplacementNamed
      });
      state = false;
    } catch (e) {
      state = false;
    }
  }

  void logout(BuildContext context) {
    deleteToken();
    // Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.signInScreen,
      (route) => false,
    );
  }
}
