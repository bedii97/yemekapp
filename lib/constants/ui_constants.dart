import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yemek_app/theme/palette.dart';

class UiConstants {
  static AppBar appBar() {
    return AppBar(
      title: lightLogo(),
      backgroundColor: Palette.greenColor,
      centerTitle: true,
    );
  }

  static AppBar appBarWithSearch() {
    return AppBar(
      title: const Text('Uygulama Başlığı'),
      backgroundColor: Colors.blue, // AppBar rengi
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // Burada arama işlemi başlatılabilir veya bir arama sayfasına geçiş yapılabilir.
          },
        ),
      ],
    );
  }

  static AppBar appBarTransparent() {
    return AppBar(
      title: UiConstants.darkLogo(),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Palette.greenColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // <-- SEE HERE
        statusBarIconBrightness:
            Brightness.light, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
    );
  }

  static AppBar emptyAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Palette.greenColor),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // <-- SEE HERE
        statusBarIconBrightness:
            Brightness.light, //<-- For Android SEE HERE (dark icons)
        statusBarBrightness:
            Brightness.light, //<-- For iOS SEE HERE (dark icons)
      ),
    );
  }

  static Text lightLogo() {
    return const Text(
      "YemekApp",
      style: TextStyle(
        color: Palette.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      ),
      // style: TextStyle(color: Colors.white),
    );
  }

  static Text darkLogo() {
    return const Text(
      "YemekApp",
      style: TextStyle(
        color: Palette.greenColor,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      ),
      // style: TextStyle(color: Colors.white),
    );
  }
}
