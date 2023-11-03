import 'package:yemek_app/models/base_response.dart';
import 'package:yemek_app/models/post.dart';

class PostResponse extends BaseResponse {
  List<Post>? posts;
  PostResponse({this.posts, int? code, String? message})
      : super(code: code, message: message);

  PostResponse.fromJson(Map<String, dynamic> json) {
    posts = json['results'];
    code = json['code'];
    message = json['message'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}
