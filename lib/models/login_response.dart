import 'package:yemek_app/models/base_response.dart';

class LoginResponse extends BaseResponse {
  String? token;
  LoginResponse({this.token, int? code, String? message})
      : super(code: code, message: message);

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
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
