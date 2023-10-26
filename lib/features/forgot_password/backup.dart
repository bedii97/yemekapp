// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:yemek_app/constants/ui_constants.dart';
// import 'package:yemek_app/theme/custom_text_style.dart';
// import 'package:yemek_app/theme/theme_helper.dart';
// import 'package:yemek_app/utils/size_utils.dart';
// import 'package:yemek_app/widgets/common_button.dart';
// import 'package:yemek_app/widgets/custom_elevated_button.dart';
// import 'package:yemek_app/widgets/custom_text_form_field.dart';

// class ForgotPasswordScreen extends StatelessWidget {
//   ForgotPasswordScreen({Key? key})
//       : super(
//           key: key,
//         );

//   TextEditingController passwordController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     mediaQueryData = MediaQuery.of(context);
//     final appBar = UiConstants.appBarTransparent();
//     SystemChrome.setSystemUIOverlayStyle(
//         const SystemUiOverlayStyle(statusBarColor: Colors.yellow));

//     return SafeArea(
//       child: Scaffold(
//         appBar: appBar,
//         // backgroundColor: appTheme.whiteA700,
//         // resizeToAvoidBottomInset: false,
//         body: Form(
//           key: _formKey,
//           child: Container(
//             width: double.maxFinite,
//             padding: EdgeInsets.only(
//               left: 20.h,
//               top: 63.v,
//               right: 20.h,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "hdr_forgot_password".tr(),
//                   style: CustomTextStyles.displaySmallInterBlack900,
//                 ),
//                 Container(
//                   width: 260.h,
//                   margin: EdgeInsets.only(
//                     left: 3.h,
//                     top: 13.v,
//                     right: 71.h,
//                   ),
//                   child: Text(
//                     "msg_to_reset_your_password".tr(),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: CustomTextStyles.bodyLargeGray50001Light.copyWith(
//                       height: 1.50,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 19.v),
//                 CustomTextFormField(
//                   controller: passwordController,
//                   hintText: "lbl_email".tr(),
//                   textInputAction: TextInputAction.done,
//                   textInputType: TextInputType.emailAddress,
//                 ),
//                 SizedBox(height: 21.v),
//                 // CustomElevatedButton(
//                 //   height: 56.v,
//                 //   text: "lbl_sign_in2".tr(),
//                 //   buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
//                 // ),
//                 CommonButton(
//                   text: "lbl_send".tr(),
//                   function: () {},
//                 ),
//                 SizedBox(height: 5.v),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
