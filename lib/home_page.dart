import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yemek_app/localization_checker.dart';
import 'package:yemek_app/theme/palette.dart';

class RiverPodPage extends ConsumerWidget {
  RiverPodPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int counter = ref.watch(counterProvider);
    _setLocale() {
      LocalizationChecker.changeLanguage(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Column(
        children: [
          Center(
            child: const Text("hello_world").tr(),
          ),
          Center(
            child: Text('Value: $counter'),
          ),
          ElevatedButton(
              onPressed: () {
                _setLocale();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.greenColor,
              ),
              child: const Text("Değiştir")),
          const SizedBox(
            height: 16.0,
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(counterProvider.notifier).state++;
            },
            child: const Text("Arttır"),
          )
        ],
      ),
    );
  }

  final counterProvider = StateProvider<int>((ref) {
    return 0;
  });
}
