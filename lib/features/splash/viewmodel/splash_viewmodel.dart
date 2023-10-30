import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yemek_app/core/utils/connection_checker.dart';
import 'package:yemek_app/core/utils/utils.dart';
import 'package:yemek_app/routes/app_routes.dart';
import 'package:yemek_app/routes/route_manager.dart';

final splashViewmodelProvider = Provider<SplashViewmodel>((ref) {
  return SplashViewmodel();
});

class SplashViewmodel {
  Future<void> requestPermissions() async {
    final camerastatus =
        await Permission.camera.request(); // Kamera izni talep etmek için
    final mediaLibraryStatus =
        await Permission.mediaLibrary.request(); // Meyda izni talep etmek için
    // final internetStatus =
    //     await Permission. // Meyda izni talep etmek için

    if (camerastatus.isGranted && mediaLibraryStatus.isGranted) {
      // İzinler verildiyse, işlemlerinizi burada gerçekleştirin.
      print("İzinler verildi.");
    } else {
      // İzinler verilmediyse, kullanıcıyı bilgilendirin veya işlem yapın.
      print("İzinler verilmedi.");
    }
  }

  Future<void> controlToLogin(BuildContext context, WidgetRef ref) async {
    // await ref.read(routeManagerProvider).deleteToken();
    bool isToken = await ref.read(routeManagerProvider).isToken();
    print(isToken);
    await Future.delayed(
      const Duration(seconds: 1),
      () {
        if (isToken) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        } else {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
        }
      },
    );
  }

  checkConnection(BuildContext context) {
    ConnectionChecker.checkConnection(context);
  }
}
