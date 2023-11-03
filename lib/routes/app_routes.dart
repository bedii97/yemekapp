import 'package:flutter/material.dart';
import 'package:yemek_app/features/auth/view/signin_screen.dart';
import 'package:yemek_app/features/auth/view/signup_screen.dart';
import 'package:yemek_app/features/forgot_password/forgot_password_screen.dart';
import 'package:yemek_app/features/home/view/home_screen.dart';
import 'package:yemek_app/features/post/view/create_post_screen.dart';
import 'package:yemek_app/features/splash/view/splash_screen.dart';

class AppRoutes {
  static const String signInScreen = '/signin_screen';
  static const String signUpScreen = '/signup_screen';
  static const String forgotPasswordScreen = '/forgot_password_screen';
  static const String homeScreen = '/home_screen';
  static const String splashScreen = '/splash_screen';
  static const String createPost = '/create_post';

  static Map<String, WidgetBuilder> routes = {
    signInScreen: (context) => const SigninScreen(),
    signUpScreen: (context) => SignupScreen(),
    forgotPasswordScreen: (context) => ForgotPasswordScreen(),
    homeScreen: (context) => HomeScreen(),
    splashScreen: (context) => const SplashScreen(),
    createPost: (context) => CreatePostScreen(),
  };
}
