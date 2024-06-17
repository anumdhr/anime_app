import 'package:anime_fever/models/anime_model.dart';
import 'package:anime_fever/widget/top_anime_picture.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/app_colors.dart';

class TopAnimeImageSlider extends StatefulWidget {
  const TopAnimeImageSlider({
    super.key,
    required this.animeList,
  });

  final List<AnimeModel> animeList;

  @override
  State<TopAnimeImageSlider> createState() => _TopAnimeImageSliderState();
}

class _TopAnimeImageSliderState extends State<TopAnimeImageSlider> {
  int currentIndex = 0;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: widget.animeList.length,
              itemBuilder: (context, index, realIndex) {
                final anime = widget.animeList.elementAt(index);
                return TopAnimePicture(anime: anime);
              },
              options: CarouselOptions(
                enlargeFactor: 0.22,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                aspectRatio: 15 / 9,
                viewportFraction: 0.88,
                autoPlay: true,
                enlargeCenterPage: true,
                initialPage: currentIndex,
              )),
          SizedBox(
            height: 20,
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: widget.animeList.length,
            effect: CustomizableEffect(
                dotDecoration: DotDecoration(borderRadius: BorderRadius.circular(10), color: Theme
                    .of(context)
                    .primaryColor, width: 28, height: 8),
                activeDotDecoration: DotDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.blueColor, width: 28, height: 8)),
          ),
        ],
      ),
    );
  }
}