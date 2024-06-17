import 'package:anime_fever/api/get_anime_by_ranking_type.dart';
import 'package:anime_fever/core/screens/error_screen.dart';
import 'package:anime_fever/views/view_all_anime_screen.dart';
import 'package:anime_fever/core/widgets/loader.dart';
import 'package:anime_fever/models/anime_model.dart';
import 'package:anime_fever/screens/anime_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeaturedAnimeList extends StatelessWidget {
  FeaturedAnimeList({super.key, required this.rankingType, required this.label});

  final String rankingType;
  final String label;

  final rr = RankedAnimeRepo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rr.getRankedAnime(rankingType: rankingType, limit: 10),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        if (snapshot.data != null) {
          final animes = snapshot.data;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return ViewAllAnimeScreen(
                              rankingType: rankingType,
                              label: label,
                            );
                          },
                        ));
                      },
                      child: const Text(
                        "View All",
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: animes!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final anime = animes.elementAt(index);
                    return AnimeTile(
                      anime: anime,
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AnimeDetailsScreen(id: anime.node!.id!),
                          )),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 10,
                  ),
                ),
              )
            ],
          );
        }
        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }
}

class AnimeTile extends StatelessWidget {
  const AnimeTile({
    super.key,
    required this.anime,
    this.onTap,
  });

  final AnimeModel anime;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                anime.node!.mainPicture!.medium!,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(anime.node!.title!,
              maxLines: 3,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              )),
        ],
      ),
    );
  }
}
