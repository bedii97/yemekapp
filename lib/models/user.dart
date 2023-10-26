class User {
  String? username;
  String? email;
  String? bio;
  String? photo;

  User({this.username, this.email, this.bio, this.photo});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    bio = json['bio'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['bio'] = bio;
    data['photo'] = photo;
    return data;
  }
}
