import 'package:anime_fever/api/get_anime_by_ranking_type.dart';
import 'package:anime_fever/core/screens/error_screen.dart';
import 'package:anime_fever/core/widgets/loader.dart';
import 'package:anime_fever/screens/anime_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridViewTab extends StatelessWidget {
  GridViewTab({super.key, required this.category});

  final String category;
  final rr = RankedAnimeRepo();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: rr.getRankedAnime(rankingType: category, limit: 100),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        if (snapshot.hasData) {
          final animes = snapshot.data;
          return GridView.builder(
            itemCount: animes!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              crossAxisSpacing: 2,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AnimeDetailsScreen(id: animes[index].node!.id!),
                    )),
                child: CachedNetworkImage(
                  imageUrl: animes[index].node!.mainPicture!.medium!,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }
        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }
}
