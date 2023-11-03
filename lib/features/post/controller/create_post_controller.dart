import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPostControllerProvider = Provider<CreatePostController>((ref) {
  return CreatePostController();
});

class CreatePostController {
  List<String> chipList = [];
}
