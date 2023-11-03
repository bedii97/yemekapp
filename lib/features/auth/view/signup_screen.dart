import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/constants/ui_constants.dart';
import 'package:yemek_app/core/utils/validations.dart';
import 'package:yemek_app/features/auth/provider/auth_provider.dart';
import 'package:yemek_app/features/auth/widgets/auth_field.dart';
import 'package:yemek_app/theme/custom_text_style.dart';
import 'package:yemek_app/core/utils/size_utils.dart';
import 'package:yemek_app/widgets/big_title_text.dart';
import 'package:yemek_app/widgets/common_button.dart';

// ignore: must_be_immutable
class SignupScreen extends ConsumerWidget {
  SignupScreen({Key? key})
      : super(
          key: key,
        );

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    mediaQueryData = MediaQuery.of(context);
    final appBar = UiConstants.appBarTransparent();

    return Scaffold(
      appBar: appBar,
      // backgroundColor: appTheme.whiteA700,
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 19.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 9.v),
                BigTitleText(text: "lbl_sign_up".tr()),
                SizedBox(height: 8.v),
                Text(
                  "msg_input_your_info".tr(),
                  style: CustomTextStyles.bodyLargeGray50001,
                ),
                SizedBox(height: 11.v),
                // CustomTextFormField(
                //   validator: Validations.usernameValidation,
                //   controller: usernameController,
                //   hintText: "lbl_username".tr(),
                // ),
                AuthField(
                  controller: usernameController,
                  hintText: 'lbl_username'.tr(),
                  validation: Validations.usernameValidation,
                ),
                SizedBox(height: 20.v),
                // CustomTextFormField(
                //   validator: Validations.emailValidation,
                //   controller: emailController,
                //   hintText: "lbl_email".tr(),
                //   textInputType: TextInputType.emailAddress,
                // ),
                AuthField(
                  controller: emailController,
                  hintText: 'lbl_email'.tr(),
                  validation: Validations.emailValidation,
                ),
                SizedBox(height: 20.v),
                AuthField(
                  controller: passwordController,
                  hintText: 'lbl_password'.tr(),
                  isPassword: true,
                  validation: Validations.passwordValidation,
                ),
                // CustomTextFormField(
                //   validator: Validations.passwordValidation,
                //   controller: passwordController,
                //   hintText: "lbl_password".tr(),
                //   textInputAction: TextInputAction.done,
                //   textInputType: TextInputType.visiblePassword,
                //   obscureText: true,
                // ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 291.h,
                    margin: EdgeInsets.only(
                      left: 22.h,
                      top: 46.v,
                      right: 24.h,
                    ),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "msg_by_creating_your".tr(),
                            style: CustomTextStyles.bodyMediumInterGray500,
                          ),
                          TextSpan(
                            text: "msg_terms_and_condition".tr(),
                            style: CustomTextStyles.titleSmallPrimary.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 19.v),
                // CustomElevatedButton(
                //   height: 56.v,
                //   text: "lbl_sign_in2".tr(),
                //   buttonTextStyle: CustomTextStyles.titleSmallOnPrimary,
                // ),
                ref.watch(authProvider)
                    ? const Center(child: CircularProgressIndicator())
                    : CommonButton(
                        text: "lbl_sign_up".tr(),
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            //Tüm validation işlemleri başarılı
                            ref.read(authProvider.notifier).register(
                                  username: usernameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context,
                                );
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
