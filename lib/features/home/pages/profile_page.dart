import 'package:flutter/material.dart';
import 'package:yemek_app/models/post.dart';
import 'package:yemek_app/theme/palette.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

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
    String image =
        'https://images.unsplash.com/photo-1603775020644-eb8decd79994?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          15) // Adjust the radius as needed
                      ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'UsernameABCDEFGHIJKLMNOP',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis nec nisi euismod, aliquam nisl quis, aliquet nisl. Donec euismod, nisl nec aliquam aliquet, elit elit aliquet nisl, quis aliquet nisl elit euismod nisl.',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 6,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            const Divider(thickness: 2.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      '50',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Posts',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Palette.greyColor,
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '50',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Followers',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Palette.greyColor,
                          ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '50',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Following',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Palette.greyColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap:
                  true, //Buradaki mühim hatayı hatice nur coşkun çözmüştür.
              crossAxisCount: 3,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
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
          ],
        ),
      ),
    );
  }
}
