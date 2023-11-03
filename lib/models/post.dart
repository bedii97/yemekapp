class Post {
  String? postId;
  String? title;
  String? body;
  String? postOwner;
  String? postOwnerPhoto;
  String? image;
  int? likeCount;
  int? commentCount;
  bool? likedByUser;

  Post(
      {this.postId,
      this.title,
      this.body,
      this.postOwner,
      this.postOwnerPhoto,
      this.image,
      this.likeCount,
      this.commentCount,
      this.likedByUser});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    title = json['title'];
    body = json['body'];
    postOwner = json['post_owner'];
    postOwnerPhoto = json['post_owner_photo'];
    image = json['image'];
    likeCount = json['like_count'];
    commentCount = json['comment_count'];
    likedByUser = json['liked_by_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['post_id'] = postId;
    data['title'] = title;
    data['body'] = body;
    data['post_owner'] = postOwner;
    data['post_owner_photo'] = postOwnerPhoto;
    data['image'] = image;
    data['like_count'] = likeCount;
    data['comment_count'] = commentCount;
    data['liked_by_user'] = likedByUser;
    return data;
  }
}
