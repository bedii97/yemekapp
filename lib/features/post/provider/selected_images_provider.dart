import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

//Bunu kullanmayıp StateNotifier kullandım güzel örnek oldu
// final selectedImagesProvider = StateProvider<List<XFile>?>((ref) {
//   return [];
// });

final selectedImagesProvider =
    StateNotifierProvider<SelectedImagesNotifier, List<XFile>?>((ref) {
  return SelectedImagesNotifier();
});

class SelectedImagesNotifier extends StateNotifier<List<XFile>?> {
  SelectedImagesNotifier() : super([]);

  set images(List<XFile> images) {
    clear();
    if (images.length <= 3) {
      state = images;
    } else {
      for (var i = 0; i < 3; i++) {
        state!.add(images[i]);
      }
    }
  }

  void clear() {
    state = [];
  }
}
