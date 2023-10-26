import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yemek_app/constants/ui_constants.dart';
import 'package:yemek_app/core/utils/size_utils.dart';
import 'package:yemek_app/routes/app_routes.dart';
import 'package:yemek_app/routes/route_manager.dart';
import 'package:yemek_app/theme/palette.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    requestPermissions();
    controlToLogin();
  }

  Future<void> requestPermissions() async {
    final camerastatus =
        await Permission.camera.request(); // Kamera izni talep etmek için
    final mediaLibraryStatus =
        await Permission.mediaLibrary.request(); // Meyda izni talep etmek için

    if (camerastatus.isGranted && mediaLibraryStatus.isGranted) {
      // İzinler verildiyse, işlemlerinizi burada gerçekleştirin.
      print("İzinler verildi.");
    } else {
      // İzinler verilmediyse, kullanıcıyı bilgilendirin veya işlem yapın.
      print("İzinler verilmedi.");
    }
  }

  Future<void> controlToLogin() async {
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

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: UiConstants.emptyAppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 0.3.ofSafeHeight),
            UiConstants.logo(),
            SizedBox(height: 0.1.ofSafeHeight),
            SizedBox(
              width: 0.5.ofWidth,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                color: Palette.greenColor,
              ),
            ),
          ],
        ),
      ),
    );

    return scaffold;
  }
}
