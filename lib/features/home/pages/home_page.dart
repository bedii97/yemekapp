import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/features/post/provider/post_provider.dart';
import 'package:yemek_app/models/post.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  Future<List<Post>?>? posts;

  @override
  void initState() {
    // //Post listemi late olarak tanımladım ve initState aşamasında set ettim.
    // //Buildde çağırırken sıkıntı etmedi o yüzden.
    //Late olarak tanımlayınca olmadı o yüzden nullable set ettim
    //FutureBuilder kullanarakta view'a bindladım
    //Asıl olay ise futureProvider tanımlama aşamasında yaşandı
    // final fetchPostProvider = FutureProvider<Future<List<Post>?>>((ref) async {
    //   final postProvider = ref.read(postStateNotifierProvider.notifier);
    //   return postProvider.getPost();
    // });
    //Ben normalde return ref.read(postStateNotifierProvider.notifier).getPost();
    //denediğimde çalışmamıştı ama böyle yapınca çalıştı
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      posts = ref.watch(postStateNotifierProvider.notifier).getPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    bool state = ref.watch(postStateNotifierProvider);
    //Çok saçma oldu ama diğer türlüde çalışmıyor amk
    return state
        ? const Center(
            child: CircularProgressIndicator.adaptive(),
          )
        : FutureBuilder(
            future: posts,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data == null) {
                return const Center(child: Text('Birilerini Takip et'));
              }
              if (snapshot.connectionState != ConnectionState.done) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return const Center(child: Text('Postların geldi'));
            },
          );
  }
  // Widget build(BuildContext context) {
  //   var state = ref.watch(postStateNotifierProvider);
  //   var posts2 = ref.read(fetchPostProvider.future);
  //   return state
  //       ? const CircularProgressIndicator.adaptive()
  //       : ListView.separated(
  //           separatorBuilder: (context, index) => const Divider(),
  //           itemCount: ref.watch(postProvider).length,
  //           itemBuilder: (context, index) {
  //             return Padding(
  //               padding: const EdgeInsets.all(8.0),
  //               child: CustomPostWidget(post: posts[index]),
  //             );
  //           },
  //         );
  // }
}





























// class _CustomListView extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     var posts = ref.watch(postStateNotifierProvider.notifier).getPost();
//     return FutureBuilder(
//       future: posts,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState != ConnectionState.done) {
//           return const CircularProgressIndicator.adaptive();
//         }
//         if (snapshot.data == null) {
//           return const Center(
//               child: Text('Takip ettiğin hiçkimseden bir gönderi yok :('));
//         }
//         if (snapshot.data != null) {
//           return ListView.separated(
//             separatorBuilder: (context, index) => const Divider(),
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: CustomPostWidget(post: ((snapshot.data![index]))),
//               );
//             },
//           );
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }
