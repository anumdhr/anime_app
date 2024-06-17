import 'package:anime_fever/screens/anime_details_screen.dart';
import 'package:anime_fever/models/anime_model.dart';
import 'package:flutter/material.dart';

class TopAnimePicture extends StatelessWidget {
  const TopAnimePicture({
    super.key,
    required this.anime,
  });

  final AnimeModel anime;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimeDetailsScreen(id: anime.node!.id!,),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            anime.node!.mainPicture!.medium!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
