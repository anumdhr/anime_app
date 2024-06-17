import 'package:anime_fever/api/get_anime_by_ranking_type.dart';
import 'package:anime_fever/core/screens/error_screen.dart';
import 'package:anime_fever/core/widgets/loader.dart';
import 'package:anime_fever/widget/top_anime_widget_slider.dart';
import 'package:flutter/material.dart';

class TopAnimeList extends StatelessWidget {
  const TopAnimeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final RankedAnimeRepo rr = RankedAnimeRepo();
    return FutureBuilder(
        future: rr.getRankedAnime(rankingType: "all", limit: 4),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          }
          if (snapshot.data != null) {
            final animes = snapshot.data!.toList();
            return TopAnimeImageSlider(
              animeList: animes,
            );
          }

          return ErrorScreen(
            error: snapshot.error.toString(),
          );
        });
  }
}

