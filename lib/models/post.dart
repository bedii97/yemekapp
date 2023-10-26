class Post {
  String? title;
  String? body;
  String? username;
  String? createdAt;
  String? image;
  int? likeCount;
  int? commentCount;

  Post(
      {this.title,
      this.body,
      this.username,
      this.createdAt,
      this.likeCount,
      this.commentCount,
      this.image});

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    username = json['username'];
    image = json['image'];
    createdAt = json['created_at'];
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['username'] = username;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['like_count'] = likeCount;
    data['comment_count'] = commentCount;
    return data;
  }
}
