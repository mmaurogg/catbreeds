import 'package:catbreeds/src/UI/pages/catbreed_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catbreeds'),
      ),
      body: CatbreedListPage(),
    );
  }
}
