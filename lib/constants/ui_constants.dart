import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yemek_app/theme/palette.dart';

class UiConstants {
  // static AppBar appBar() {
  //   return AppBar(
  //     title: SvgPicture.asset(
  //       AssetsConstants.twitterLogo,
  //       // color: Pallete.blueColor,
  //       colorFilter: const ColorFilter.mode(
  //         Palette.blueColor,
  //         BlendMode.srcIn,
  //       ),
  //       height: 30,
  //     ),
  //     centerTitle: true,
  //   );
  // }

  static AppBar appBar() {
    return AppBar(
      title: logo(),
      backgroundColor: Palette.greenColor,
      centerTitle: true,
    );
  }

  static AppBar appBarTransparent() {
    return AppBar(
      title: UiConstants.logo(),
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

  // AppBar customAppbar() {
  //   return AppBar(
  //     elevation: 0,
  //     // toolbarHeight: 200.v,
  //     backgroundColor: Palette.greenColor,
  //     leading: Padding(
  //       padding: const EdgeInsets.only(left: 8.0, top: 8.0),
  //       child: Row(
  //         // mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           AppbarImageButton(),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 8.0, top: 8.0),
  //             child: SizedBox(
  //               width: 0.53.ofWidth,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "Muhammed Bedii Yüreke2gxss",
  //                     overflow: TextOverflow.ellipsis,
  //                     style: CustomTextStyles.titleSmallPrimaryBold,
  //                   ),
  //                   Text(
  //                     "Welcome Back!",
  //                     style: CustomTextStyles.titleSmallGray500,
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //     leadingWidth: 0.7
  //         .ofWidth, //normalde 0.7 vermeliyimde iosta 1 vermeden olmuyor ya da username kısa olacak
  //     actions: [
  //       Align(
  //         alignment: Alignment.topRight,
  //         child: AppbarIconbutton(
  //           icon: Icons.notifications_outlined,
  //           iconColor: Palette.whiteColor.withOpacity(0.6),
  //           margin: EdgeInsets.only(
  //             right: 16.h,
  //             // top: 7.v,
  //             // bottom: 16.v,
  //             //Ortaladığına inanıyorum
  //             // bottom: 0.5.ofTopHeight,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  static Text logo() {
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
}
