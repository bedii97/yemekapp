import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/core/utils/size_utils.dart';
import 'package:yemek_app/models/post.dart';
import 'package:yemek_app/theme/palette.dart';

class CustomPostWidget extends ConsumerWidget {
  final Post post;

  const CustomPostWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Row(
            children: [
              Icon(
                Icons.person,
                size: 50.0,
              ),
              Text("Username")
            ],
          ),
          post.image != null
              ? Image.network(post.image as String)
              : const SizedBox(),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            post.title ?? "Null",
            style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Palette.greenColor),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(post.body ?? "Null"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.favorite,
                      color: Palette.favoriteColorActive,
                    ),
                    Text('${post.likeCount}'),
                  ],
                ),
                SizedBox(
                  width: 0.07.ofWidth,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.mode_comment_outlined,
                      color: Palette.greenColor,
                    ),
                    Text('${post.commentCount}'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
