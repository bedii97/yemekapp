import 'package:flutter/material.dart';
import 'package:yemek_app/models/post.dart';
import 'package:yemek_app/theme/palette.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  List<Post> posts = [
    Post(title: 'Title1', image: 'https://picsum.photos/200/301'),
    Post(title: 'Title2', image: 'https://picsum.photos/200/302'),
    Post(title: 'Title3', image: 'https://picsum.photos/200/303'),
    Post(title: 'Title4', image: 'https://picsum.photos/200/304'),
    Post(title: 'Title5', image: 'https://picsum.photos/200/305'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/306'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/307'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/308'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/309'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/310'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/311'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/312'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/313'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/314'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/315'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/316'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/317'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/318'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/319'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/320'),
    Post(title: 'Title6', image: 'https://picsum.photos/200/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/201/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/202/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/203/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/204/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/205/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/206/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/207/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/208/300'),
    Post(title: 'Title6', image: 'https://picsum.photos/209/300'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            //Gesture ile yapta basılı tutunca dışarı taşıyor efekt
            suffixIcon:
                IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            filled: true,
            fillColor: Palette.whiteColor,
            contentPadding: const EdgeInsets.only(left: 8, bottom: 0, top: 0),
            focusedErrorBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            errorBorder: outlineInputBorder,
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            children: List.generate(posts.length, (index) {
              return GestureDetector(
                onTap: () {
                  print('Selami${posts[index].postId}');
                },
                child: Image.network(
                  posts[index].image!,
                  fit: BoxFit.cover,
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  OutlineInputBorder get outlineInputBorder => OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Palette.white200Color,
        ),
      );
}
