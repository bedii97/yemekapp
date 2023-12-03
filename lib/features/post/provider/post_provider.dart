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
import 'package:yemek_app/models/post.dart';
import 'package:yemek_app/models/post_response.dart';

final postStateNotifierProvider =
    StateNotifierProvider<PostProvider, bool>((ref) {
  return PostProvider(ref.watch(postServiceProvider));
});

class PostProvider extends StateNotifier<bool> with TokenManager {
  final PostService _postService;
  PostProvider(this._postService) : super(false);

  BaseResponse? _baseResponse;
  PostResponse? _postResponse;
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

  Future<List<Post>?> getPost() async {
    try {
      state = true;
      await _postService.getPost().then((postResponse) async {
        _postResponse = postResponse;
        if ((postResponse?.code) is int && postResponse?.code == 200) {
          state = false;
          return postResponse;
        } else {
          state = false;
          print(postResponse?.message);
        }
      }).onError(
        (error, stackTrace) {
          state = false;
          print(stackTrace);
          return _postResponse;
        },
      );
      state = false;
    } on DioException catch (e) {
      state = false;
      print(e);
    } catch (e) {
      print(e);
    }
    return null;
  }
}
