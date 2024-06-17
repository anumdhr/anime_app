import 'package:anime_fever/api/get_anime_by_ranking_type.dart';
import 'package:anime_fever/core/screens/error_screen.dart';
import 'package:anime_fever/core/widgets/loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewAllAnimeScreen extends StatelessWidget {
  final String rankingType;
  final String label;

  ViewAllAnimeScreen({
    super.key,
    required this.rankingType,
    required this.label,
  });

  final rr = RankedAnimeRepo();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color containerColor = isDarkMode ? Colors.white10 : Colors.black12;
    return Scaffold(
      appBar: AppBar(
        title: Text(label),
      ),
      body: FutureBuilder(
        future: rr.getRankedAnime(rankingType: rankingType, limit: 500),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          }
          if (snapshot.hasData) {
            final animeList = snapshot.data;
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 2);
              },
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: animeList!.length,
              itemBuilder: (context, index) {
                // final anime = animeList.elementAt(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: containerColor,
                    ),
                    height: 100,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            animeList[index].node!.mainPicture!.medium!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            "${animeList[index].node!.title}",
                            // maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return ErrorScreen(error: snapshot.error.toString());
        },
      ),
    );
  }
}
