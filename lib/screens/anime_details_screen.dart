import 'package:anime_fever/api/get_anime_details.dart';
import 'package:anime_fever/common/extensions/extension.dart';
import 'package:anime_fever/common/sized_box/sizedbox.dart';
import 'package:anime_fever/common/styles/padding.dart';
import 'package:anime_fever/common/widgets/back_button.dart';
import 'package:anime_fever/common/widgets/network_image_view.dart';
import 'package:anime_fever/common/widgets/view_more_text.dart';
import 'package:anime_fever/config/theme/app_theme.dart';
import 'package:anime_fever/core/screens/error_screen.dart';

// import 'package:anime_fever/common/extensions.dart';
import 'package:anime_fever/core/widgets/loader.dart';
import 'package:anime_fever/models/anime_details_model.dart';
import 'package:anime_fever/views/similar_anime_view.dart';
import 'package:anime_fever/widget/anime_info_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AnimeDetailsScreen extends StatelessWidget {
  const AnimeDetailsScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getAnimeDetails(id: id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        }
        if (snapshot.data != null) {
          final animeDetails = snapshot.data;
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTopImage(imageUrl: animeDetails!.mainPicture!.large!),
                    Padding(
                      padding: Paddings.defaultPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTitle(title: animeDetails.title!, englishTitle: animeDetails.alternativeTitles!.en!),
                          ViewMoreText(animeDetails: animeDetails.synopsis!),
                          sBox10,
                          _buildAnimeInformation(animeDetails: animeDetails),
                          sBox10,
                          animeDetails.background!.isNotEmpty ? _backgroundOfAnime(background: animeDetails.background!) : const SizedBox.shrink(),
                          sBox10,
                          _buildAllImages(images: animeDetails.pictures!),
                          sBox10,
                          // SimilarAnimeView(node: animeDetails.recommendations!.map((e) => e.node).toList(), label: "More Recommendations")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return ErrorScreen(error: snapshot.error.toString());
      },
    );
  }

  _backgroundOfAnime({required String background}) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      color: Colors.white24,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          background,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildTopImage({required String imageUrl}) {
    return Stack(
      children: [
        CachedNetworkImage(
          height: 400,
          width: double.infinity,
          imageUrl: imageUrl,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 10,
          left: 10,
          //since we couldnot access the context so we used builder here to get context
          child: Builder(builder: (context) {
            return CommonBackButton(
              onTap: () {
                Navigator.pop(context);
              },
            );
          }),
        )
      ],
    );
  }

  Widget _buildAllImages({required List<Picture> images}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Image Gallery",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        sBox10,
        GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 9 / 16,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final image = images[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NetworkImageView(imageUrl: image.large!);
                    },
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: image.medium!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildTitle({required String title, required String englishTitle}) {
    return Builder(builder: (context) {
      return Text(
        englishTitle,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      );
    });
  }

  Widget _buildAnimeInformation({required AnimeDetailsModel animeDetails}) {
    String genre = animeDetails.genres!.map((genre) => genre.name).join(", ");
    String studio = animeDetails.studios!.map((e) => e.name).join(", ");
    String altTitles = animeDetails.alternativeTitles!.synonyms!.map((e) => e).join(", ");

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimeInfoText(label: "Genre :", info: genre),
        AnimeInfoText(label: "Start Date :", info: animeDetails.startDate!),
        AnimeInfoText(label: "End Date: ", info: animeDetails.endDate ?? 'Ongoing'),
        AnimeInfoText(label: "Episodes: ", info: animeDetails.numEpisodes.toString()),
        AnimeInfoText(label: "Average Episode Duration: ", info: animeDetails.averageEpisodeDuration!.toMinute()),
        AnimeInfoText(label: "Status: ", info: animeDetails.status!),
        AnimeInfoText(label: "Ratings: ", info: animeDetails.rating!),
        AnimeInfoText(label: "Studios: ", info: studio),
        AnimeInfoText(label: "Other Names: ", info: altTitles),
        AnimeInfoText(label: "English Name: ", info: animeDetails.alternativeTitles!.en!),
        AnimeInfoText(label: "Japanese Name: ", info: animeDetails.alternativeTitles!.ja!),
      ],
    );
  }
}
