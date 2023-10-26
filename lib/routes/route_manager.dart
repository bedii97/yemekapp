import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/core/utils/token_manager.dart';
import 'package:yemek_app/routes/app_routes.dart';

final routeManagerProvider = Provider((ref) => RouteManager());

class RouteManager with TokenManager {
  RouteManager() {
    getInitialRoute();
  }
  Future<String> getInitialRoute() async {
    // String route = AppRoutes.forgotPasswordScreen;
    final token = await getToken();
    if (token != null) {
      return AppRoutes.homeScreen;
    } else {
      return AppRoutes.signInScreen;
    }
  }
}
