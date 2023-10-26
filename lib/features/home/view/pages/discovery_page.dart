import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.yellow,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: const Text('Keşfet Ekranı'),
      ),
    );
  }
}
