// ignore_for_file: use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemek_app/constants/server_errors.dart';
import 'package:yemek_app/core/utils/token_manager.dart';
import 'package:yemek_app/core/utils/utils.dart';
import 'package:yemek_app/features/post/service/post_service.dart';
import 'package:yemek_app/models/base_response.dart';

final postStateNotifierProvider =
    StateNotifierProvider<PostProvider, bool>((ref) {
  return PostProvider(ref.watch(postServiceProvider));
});

class PostProvider extends StateNotifier<bool> with TokenManager {
  final PostService _postService;
  PostProvider(this._postService) : super(false);

  BaseResponse? _baseResponse;
  //State isLoading görevi görüyor

  void createPost(
      {required String title,
      required List<XFile>? images,
      required List<String> materials,
      required String body,
      required BuildContext context}) async {
    try {
      state = true;
      await _postService
          .createPost(
              title: title, body: body, images: images, materials: materials)
          .then((baseResponse) async {
        _baseResponse = baseResponse;
        print(_baseResponse);
        if ((baseResponse?.code) is int && baseResponse?.code == 200) {
          state = false;
          showSnackBar(context, 'Başarıyla tarif ekledin');
          //pushReplacementNamed
        } else {
          print('object');
          state = false;
          showSnackBar(
            context,
            (ServerErrors.errors.containsValue(baseResponse?.message)
                    ? baseResponse?.message
                    : 'undefined_error')!
                .tr(),
          );
        }
      }).onError(
        (error, stackTrace) {
          state = false;
          showSnackBar(
            context,
            (ServerErrors.errors.containsValue(_baseResponse?.message)
                    ? _baseResponse?.message
                    : 'undefined_error')!
                .tr(),
          );
          print(stackTrace);
        },
      );
      state = false;
    } on DioException catch (e) {
      state = false;
      showSnackBar(
        context,
        (ServerErrors.errors.containsValue(_baseResponse?.message)
                ? _baseResponse?.message
                : 'undefined_error')!
            .tr(),
      );
      print(e);
    } catch (e) {
      showSnackBar(
        context,
        (ServerErrors.errors.containsValue(_baseResponse?.message)
                ? _baseResponse?.message
                : 'undefined_error')!
            .tr(),
      );
      print(e);
    }
  }

  // void register(
  //     {required String username,
  //     required String email,
  //     required String password,
  //     required BuildContext context}) async {
  //   try {
  //     state = true;
  //     await _authService
  //         .register(username: username, email: email, password: password)
  //         .then((baseResponse) {
  //       if (baseResponse?.code == 200) {
  //         // Navigator.pushNamed(context, AppRoutes.homeScreen);
  //         showSnackBar(context, 'registration_check_email'.tr());
  //         Navigator.pushNamedAndRemoveUntil(
  //           context,
  //           AppRoutes.signInScreen,
  //           (route) => false,
  //         );
  //       } else {
  //         showSnackBar(
  //             context,
  //             (ServerErrors.errors.containsValue(baseResponse?.message)
  //                     ? baseResponse?.message
  //                     : 'undefined_error')!
  //                 .tr());
  //       }
  //       //pushReplacementNamed
  //     });
  //     state = false;
  //   } catch (e) {
  //     state = false;
  //   }
  // }

  // void logout(BuildContext context) {
  //   deleteToken();
  //   // Navigator.pushReplacementNamed(context, AppRoutes.signInScreen);
  //   Navigator.pushNamedAndRemoveUntil(
  //     context,
  //     AppRoutes.signInScreen,
  //     (route) => false,
  //   );
  // }
}
