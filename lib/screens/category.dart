import 'package:anime_fever/models/anime_category_model.dart';
import 'package:anime_fever/views/anime_grid_View.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: animeCategory.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Anime Category"),
          bottom: TabBar(
            labelColor: Colors.red,
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              tabs: animeCategory
                  .map((e) => Tab(
                        text: e.title,
                      ))
                  .toList()),
        ),
        body: TabBarView(children: animeCategory.map((e) => GridViewTab(category: e.rankingType)).toList()),
      ),
    );
  }
}
