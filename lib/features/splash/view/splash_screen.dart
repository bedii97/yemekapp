import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/constants/ui_constants.dart';
import 'package:yemek_app/core/utils/size_utils.dart';
import 'package:yemek_app/features/splash/viewmodel/splash_viewmodel.dart';
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
    // requestPermissions();
    // controlToLogin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final splashViewmodel = ref.read(splashViewmodelProvider);
    splashViewmodel.requestPermissions();
    splashViewmodel.controlToLogin(context, ref);
    splashViewmodel.checkConnection(context);
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
