import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/constants/ui_constants.dart';
import 'package:yemek_app/core/utils/validations.dart';
import 'package:yemek_app/features/auth/provider/auth_provider.dart';
import 'package:yemek_app/routes/app_routes.dart';
import 'package:yemek_app/widgets/big_title_text.dart';
import 'package:yemek_app/widgets/common_button.dart';
import 'package:yemek_app/widgets/custom_text_form_field.dart';
import 'package:yemek_app/widgets/linked_text.dart';
import 'package:yemek_app/widgets/small_title_text.dart';

class SigninScreen extends ConsumerStatefulWidget {
  //Bu route işlemini mixinler ile de çözebilirim gibi
  static route() => MaterialPageRoute(
        builder: (context) => const SigninScreen(),
      );
  const SigninScreen({super.key});

  @override
  ConsumerState<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends ConsumerState<SigninScreen> {
  final usernamecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  void dispose() {
    //textControllerlar dispose edilecek
    super.dispose();
    usernamecontroller.dispose();
    passwordcontroller.dispose();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appBar = UiConstants.appBarTransparent();

    return Scaffold(
      appBar: appBar,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigTitleText(text: "lbl_sign_in".tr()),
                const SizedBox(height: 16.0),
                SmallTitleText(
                  text: 'msg_input_your_registered'.tr(),
                ),
                const SizedBox(height: 16.0),
                // AuthInput(hint: "Email"),
                CustomTextFormField(
                  validator: Validations.usernameValidation,
                  controller: usernamecontroller,
                  hintText: "lbl_username".tr(),
                ),
                const SizedBox(height: 16.0),
                // AuthInput(
                //   hint: "Password",
                //   isPassword: true,
                // ),
                CustomTextFormField(
                  validator: Validations.passwordValidation,
                  controller: passwordcontroller,
                  hintText: "lbl_password".tr(),
                  obscureText: true,
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: LinkedText(
                      function: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.forgotPasswordScreen);
                      },
                      text: "lbl_forgot_password".tr()),
                ),
                const SizedBox(height: 16.0),
                ref.watch(authProvider)
                    ? const Center(child: CircularProgressIndicator())
                    : CommonButton(
                        text: "lbl_sign_in".tr(),
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            ref.watch(authProvider.notifier).login(
                                username: usernamecontroller.text,
                                password: passwordcontroller.text,
                                context: context);
                          }
                        }),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallTitleText(text: "msg_dont_have_account".tr()),
                    LinkedText(
                        text: "lbl_sign_up".tr(),
                        function: () {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.signUpScreen);
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
