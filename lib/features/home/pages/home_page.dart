import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/models/post.dart';
import 'package:yemek_app/widgets/custom_post_widget.dart';

final postProvider = Provider<List<Post>>((ref) {
  return [
    Post(
      title: "Hasta Çorbası",
      body:
          '''Baharat ve tuz hariç bütün malzemeyi tencereye alalım ,güzelce karıştırıp üzerine sıcak su ilave edelim.
Tencereyi ocağa alıp kısık ateşte 20-25 dakika pişirelim.
Sonrasında tavukları ayırıp blenderla iyice ezelim.
Tavukları didip tekrar çorbanın içerisine ilave edelim.
Tuzunu ve baharatını da ilave edip karıştırıp servis edelim,afiyetler olsun detaylı tarif için tıklarınız👇.''',
      postOwner: "Kullanıcı adı",
      image: 'https://i.nefisyemektarifleri.com/2023/10/20/hasta-corbasi.jpg',
      commentCount: 12,
      likeCount: 10,
    ),
    Post(
        title: "Çikolatalı Kahveli Muhallebi",
        body:
            '''Çikolatalı kahveli muhallebi için öncelikle sütü uygun bir tencereye alalım.
Üzerine şeker, un ve nişastayı ekleyerek pürüzsüz olacak şekilde karıştıralım.
Ocağın altını açalım ve muhallebi kaynayıp göz göz oluncaya kadar orta ateşte sürekli karıştırarak muhallebimizi pişirmeye başlayalım. Bu aşamada ocağı çok yüksek ateşte açmamaya dikkat etmelisiniz.
Kaynamaya başladıktan sonra muhallebimizin içerisine krema ve vanilya ilave edelim. Bir kaç tur daha karıştırarak tencereyi ocaktan alalım.
Hazır olan muhallebimizi 3 ayrı kaba eşit bir şekilde paylaştıralım.
Kaplardan bir tanesine granül kahve ilave edelim ve çözülene kadar karıştıralım.
Diğer kabada bitter çikolata ilave edelim ve homojen bir kıvam alana kadar karıştıralım.
Kullanacağımız servis kaplarına önce beyaz muhallebiyi paylaştıralım.
Ardından kahveli muhallebiyi de aynı şekilde paylaştıralım.
Son olarak çikolatalı muhallebiyi paylaştırıp üzerlerini düzeltelim.
Hazırladığımız muhallebiler oda ısısına geldikten sonra soğuması için dolaba kaldıralım.
2 saat kadar buzdolabında dinlendirdiğimiz kakaolu muhallebilerimizi dilediğimiz şekilde süsleyerek servis edelim. Afiyet olsun!''',
        postOwner: "İbrahimBuru",
        image:
            'https://i.nefisyemektarifleri.com/2023/10/20/cikolatali-kahveli-muhallebi.jpg',
        commentCount: 22,
        likeCount: 16),
    Post(
        title: "Çikolatalı Kahveli Muhallebi",
        body:
            '''Çikolatalı kahveli muhallebi için öncelikle sütü uygun bir tencereye alalım.
Üzerine şeker, un ve nişastayı ekleyerek pürüzsüz olacak şekilde karıştıralım.
Ocağın altını açalım ve muhallebi kaynayıp göz göz oluncaya kadar orta ateşte sürekli karıştırarak muhallebimizi pişirmeye başlayalım. Bu aşamada ocağı çok yüksek ateşte açmamaya dikkat etmelisiniz.
Kaynamaya başladıktan sonra muhallebimizin içerisine krema ve vanilya ilave edelim. Bir kaç tur daha karıştırarak tencereyi ocaktan alalım.
Hazır olan muhallebimizi 3 ayrı kaba eşit bir şekilde paylaştıralım.
Kaplardan bir tanesine granül kahve ilave edelim ve çözülene kadar karıştıralım.
Diğer kabada bitter çikolata ilave edelim ve homojen bir kıvam alana kadar karıştıralım.
Kullanacağımız servis kaplarına önce beyaz muhallebiyi paylaştıralım.
Ardından kahveli muhallebiyi de aynı şekilde paylaştıralım.
Son olarak çikolatalı muhallebiyi paylaştırıp üzerlerini düzeltelim.
Hazırladığımız muhallebiler oda ısısına geldikten sonra soğuması için dolaba kaldıralım.
2 saat kadar buzdolabında dinlendirdiğimiz kakaolu muhallebilerimizi dilediğimiz şekilde süsleyerek servis edelim. Afiyet olsun!''',
        postOwner: "İbrahimBuru",
        image:
            'https://i.nefisyemektarifleri.com/2023/10/20/cikolatali-kahveli-muhallebi.jpg',
        commentCount: 22,
        likeCount: 16),
  ];
});

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _CustomListView();
  }
}

class _CustomListView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.read(postProvider);
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: ref.watch(postProvider).length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomPostWidget(post: posts[index]),
        );
      },
    );
  }
}

class _CustomListTile extends ConsumerWidget {
  final int index;
  const _CustomListTile(this.index);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ListTile(
        leading: Image.asset("assets/images/piyaz.jpg"),
        title: Text(ref.read(postProvider)[index].title ?? "Boş"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ref.read(postProvider)[index].body ?? "Boş"),
            Row(
              children: [
                const Icon(Icons.thumb_up),
                Text('Likes: ${ref.read(postProvider)[index].likeCount}'),
                const Icon(Icons.comment),
                Text('Comments: ${ref.read(postProvider)[index].commentCount}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
