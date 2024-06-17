import 'package:anime_fever/common/styles/padding.dart';
import 'package:anime_fever/views/featured_animes.dart';
import 'package:anime_fever/widget/top_anime_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimeScreen extends StatefulWidget {
  const AnimeScreen({super.key});

  @override
  State<AnimeScreen> createState() => _AnimeScreenState();
}

class _AnimeScreenState extends State<AnimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: const Text(
          'Anime World',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: TopAnimeList(),
            ),
            Padding(
              padding: Paddings.noBottomPadding,
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimeList(
                      label: "Top Ranked",
                      rankingType: "all",
                    ),
                  ),
                  SizedBox(
                    height: 350,
                    child: FeaturedAnimeList(
                      label: "Top Popular",
                      rankingType: "bypopularity",
                    ),
                  ),
                  FeaturedAnimeList(
                    label: "Top Favourite",
                    rankingType: "favorite",
                  ), FeaturedAnimeList(
                    label: "Top Movies",
                    rankingType: "movie",
                  ), FeaturedAnimeList(
                    label: "Top Upcoming",
                    rankingType: "upcoming",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
