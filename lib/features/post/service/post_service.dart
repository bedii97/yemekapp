// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yemek_app/constants/service_constants.dart';
import 'package:yemek_app/core/utils/api_service.dart';
import 'package:yemek_app/core/utils/connection_checker.dart';
import 'package:yemek_app/core/utils/token_manager.dart';
import 'package:yemek_app/models/base_response.dart';
import 'package:yemek_app/models/post_response.dart';

final postServiceProvider = Provider<PostService>((ref) {
  return PostService(ref.watch(dioProvider));
});

class PostService with TokenManager {
  final Dio _dio;
  bool isLoggedIn = false;
  PostService(this._dio);

  Future<BaseResponse?> createPost(
      {required String title,
      required List<XFile>? images,
      required List<String> materials,
      required String body}) async {
    try {
      bool isConnected = await ConnectionChecker.checkConnection2();
      if (!isConnected) return null;
      // final response = await _dio.post(ServiceConstants.login, data: {
      //   'username': username,
      //   'password': password,
      // });

      List<MultipartFile> tempFiles = [];
      for (var i = 0; i < images!.length; i++) {
        var asd = await MultipartFile.fromFile(
          images[i].path,
          filename: 'image.jpg',
          // contentType: MediaType('image', 'jpg'),
        );
        tempFiles.add(asd);
      }
      FormData formData = FormData.fromMap({
        'title': title,
        'materials': materials,
        'body': body,
        'files': tempFiles,
      });
      _dio.options.headers['token'] = await getToken();
      Response response =
          await _dio.post(ServiceConstants.post, data: formData);
      var baseResponse = BaseResponse.fromJson(response.data);
      if (baseResponse.code == 200) {
        return baseResponse;
      } else {
        return baseResponse;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('asd');
        print(e.response);
        return BaseResponse.fromJson(e.response!.data);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return BaseResponse(message: e.message, code: 400);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<PostResponse?> getPost() async {
    try {
      bool isConnected = await ConnectionChecker.checkConnection2();
      if (!isConnected) return null;
      _dio.options.headers['token'] = await getToken();
      Response response = await _dio.get(ServiceConstants.getPost);
      var postResponse = PostResponse.fromJson(response.data);
      if (postResponse.code == 200) {
        return postResponse;
      } else {
        return postResponse;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('asd');
        print(e.response);
        return PostResponse.fromJson(e.response!.data);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        return PostResponse(message: e.message, code: 400);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  // Future<BaseResponse?> register(
  //     {required String username,
  //     required String password,
  //     required String email}) async {
  //   BaseResponse response2;
  //   try {
  //     bool isConnected = await ConnectionChecker.checkConnection2();
  //     if (!isConnected) return null;
  //     final response = await _dio.post(ServiceConstants.register, data: {
  //       'username': username,
  //       'email': email,
  //       'password': password,
  //     });

  //     response2 = BaseResponse.fromJson(response.data);
  //     if (response2.code == 200) {
  //       // Giriş başarılı, kullanıcı bilgilerini UserModel'e kaydedebilirsiniz.
  //       return response2;
  //     } else {
  //       response2;
  //     }
  //   } catch (error) {
  //     return BaseResponse(code: 400, message: error.toString());
  //   }
  //   return response2;
  // }

  // void logout() {
  //   isLoggedIn = false;
  // }
}
