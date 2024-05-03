import 'package:flutter/material.dart';

import 'home.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          NewsListViewBuilder(
            category:'sports',
          ),
        ],
      ),
    );
  }
}
