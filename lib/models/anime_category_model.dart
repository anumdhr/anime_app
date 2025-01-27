class AnimeCategory {
  String title;
  String rankingType;

  AnimeCategory({required this.title, required this.rankingType});

  factory AnimeCategory.fromJson(Map<String, dynamic> json) {
    return AnimeCategory(
      title: json['title'],
      rankingType: json['rankingType'],
    );
  }
}

List<AnimeCategory> animeCategory =[
  AnimeCategory(title: "Top Anime", rankingType: 'all'),
  AnimeCategory(title: "Top Airing", rankingType: 'airing'),
  AnimeCategory(title: "Top Upcoming", rankingType: 'upcoming'),
  AnimeCategory(title: "Top TV Series", rankingType: 'tv'),
  AnimeCategory(title: "Top OVA", rankingType: 'ova'),
  AnimeCategory(title: "Top Movies", rankingType: 'movie'),
  AnimeCategory(title: "Top Specials", rankingType: 'special'),
  AnimeCategory(title: "Top Popularity", rankingType: 'bypopularity'),
  AnimeCategory(title: "Top Favourite", rankingType: 'favorite'),
];
