// To parse this JSON data, do
//
//     final animeDetailsModel = animeDetailsModelFromJson(jsonString);

import 'dart:convert';

import 'package:anime_fever/models/node_model.dart';

AnimeDetailsModel animeDetailsModelFromJson(String str) => AnimeDetailsModel.fromJson(json.decode(str));

String animeDetailsModelToJson(AnimeDetailsModel data) => json.encode(data.toJson());

class AnimeDetailsModel {
  int? id;
  String? title;
  Picture? mainPicture;
  AlternativeTitles? alternativeTitles;
  String? startDate;
  String? endDate;
  String? synopsis;
  double? mean;
  int? rank;
  int? popularity;
  int? numListUsers;
  int? numScoringUsers;
  String? nsfw;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? mediaType;
  String? status;
  List<Genre>? genres;
  int? numEpisodes;
  StartSeason? startSeason;
  Broadcast? broadcast;
  String? source;
  int? averageEpisodeDuration;
  String? rating;
  List<Picture>? pictures;
  String? background;
  List<RelatedAnime>? relatedAnime;
  List<dynamic>? relatedManga;
  List<Recommendation>? recommendations;
  List<Genre>? studios;
  Statistics? statistics;

  AnimeDetailsModel({
    this.id,
    this.title,
    this.mainPicture,
    this.alternativeTitles,
    this.startDate,
    this.endDate,
    this.synopsis,
    this.mean,
    this.rank,
    this.popularity,
    this.numListUsers,
    this.numScoringUsers,
    this.nsfw,
    this.createdAt,
    this.updatedAt,
    this.mediaType,
    this.status,
    this.genres,
    this.numEpisodes,
    this.startSeason,
    this.broadcast,
    this.source,
    this.averageEpisodeDuration,
    this.rating,
    this.pictures,
    this.background,
    this.relatedAnime,
    this.relatedManga,
    this.recommendations,
    this.studios,
    this.statistics,
  });

  AnimeDetailsModel copyWith({
    int? id,
    String? title,
    Picture? mainPicture,
    AlternativeTitles? alternativeTitles,
    String? startDate,
    String? endDate,
    String? synopsis,
    double? mean,
    int? rank,
    int? popularity,
    int? numListUsers,
    int? numScoringUsers,
    String? nsfw,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? mediaType,
    String? status,
    List<Genre>? genres,
    int? numEpisodes,
    StartSeason? startSeason,
    Broadcast? broadcast,
    String? source,
    int? averageEpisodeDuration,
    String? rating,
    List<Picture>? pictures,
    String? background,
    List<RelatedAnime>? relatedAnime,
    List<dynamic>? relatedManga,
    List<Recommendation>? recommendations,
    List<Genre>? studios,
    Statistics? statistics,
  }) =>
      AnimeDetailsModel(
        id: id ?? this.id,
        title: title ?? this.title,
        mainPicture: mainPicture ?? this.mainPicture,
        alternativeTitles: alternativeTitles ?? this.alternativeTitles,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        synopsis: synopsis ?? this.synopsis,
        mean: mean ?? this.mean,
        rank: rank ?? this.rank,
        popularity: popularity ?? this.popularity,
        numListUsers: numListUsers ?? this.numListUsers,
        numScoringUsers: numScoringUsers ?? this.numScoringUsers,
        nsfw: nsfw ?? this.nsfw,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        mediaType: mediaType ?? this.mediaType,
        status: status ?? this.status,
        genres: genres ?? this.genres,
        numEpisodes: numEpisodes ?? this.numEpisodes,
        startSeason: startSeason ?? this.startSeason,
        broadcast: broadcast ?? this.broadcast,
        source: source ?? this.source,
        averageEpisodeDuration: averageEpisodeDuration ?? this.averageEpisodeDuration,
        rating: rating ?? this.rating,
        pictures: pictures ?? this.pictures,
        background: background ?? this.background,
        relatedAnime: relatedAnime ?? this.relatedAnime,
        relatedManga: relatedManga ?? this.relatedManga,
        recommendations: recommendations ?? this.recommendations,
        studios: studios ?? this.studios,
        statistics: statistics ?? this.statistics,
      );

  factory AnimeDetailsModel.fromJson(Map<String, dynamic> json) => AnimeDetailsModel(
    id: json["id"],
    title: json["title"],
    mainPicture: json["main_picture"] == null ? null : Picture.fromJson(json["main_picture"]),
    alternativeTitles: json["alternative_titles"] == null ? null : AlternativeTitles.fromJson(json["alternative_titles"]),
    startDate: json["start_date"],
    endDate: json["end_date"],
    synopsis: json["synopsis"],
    mean: json["mean"]?.toDouble(),
    rank: json["rank"],
    popularity: json["popularity"],
    numListUsers: json["num_list_users"],
    numScoringUsers: json["num_scoring_users"],
    nsfw: json["nsfw"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    mediaType: json["media_type"],
    status: json["status"],
    genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
    numEpisodes: json["num_episodes"],
    startSeason: json["start_season"] == null ? null : StartSeason.fromJson(json["start_season"]),
    broadcast: json["broadcast"] == null ? null : Broadcast.fromJson(json["broadcast"]),
    source: json["source"],
    averageEpisodeDuration: json["average_episode_duration"],
    rating: json["rating"],
    pictures: json["pictures"] == null ? [] : List<Picture>.from(json["pictures"]!.map((x) => Picture.fromJson(x))),
    background: json["background"],
    relatedAnime: json["related_anime"] == null ? [] : List<RelatedAnime>.from(json["related_anime"]!.map((x) => RelatedAnime.fromJson(x))),
    relatedManga: json["related_manga"] == null ? [] : List<dynamic>.from(json["related_manga"]!.map((x) => x)),
    recommendations: json["recommendations"] == null ? [] : List<Recommendation>.from(json["recommendations"]!.map((x) => Recommendation.fromJson(x))),
    studios: json["studios"] == null ? [] : List<Genre>.from(json["studios"]!.map((x) => Genre.fromJson(x))),
    statistics: json["statistics"] == null ? null : Statistics.fromJson(json["statistics"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "main_picture": mainPicture?.toJson(),
    "alternative_titles": alternativeTitles?.toJson(),
    "start_date": startDate,
    "end_date": endDate,
    "synopsis": synopsis,
    "mean": mean,
    "rank": rank,
    "popularity": popularity,
    "num_list_users": numListUsers,
    "num_scoring_users": numScoringUsers,
    "nsfw": nsfw,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "media_type": mediaType,
    "status": status,
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
    "num_episodes": numEpisodes,
    "start_season": startSeason?.toJson(),
    "broadcast": broadcast?.toJson(),
    "source": source,
    "average_episode_duration": averageEpisodeDuration,
    "rating": rating,
    "pictures": pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x.toJson())),
    "background": background,
    "related_anime": relatedAnime == null ? [] : List<dynamic>.from(relatedAnime!.map((x) => x.toJson())),
    "related_manga": relatedManga == null ? [] : List<dynamic>.from(relatedManga!.map((x) => x)),
    "recommendations": recommendations == null ? [] : List<dynamic>.from(recommendations!.map((x) => x.toJson())),
    "studios": studios == null ? [] : List<dynamic>.from(studios!.map((x) => x.toJson())),
    "statistics": statistics?.toJson(),
  };
}

class AlternativeTitles {
  List<String>? synonyms;
  String? en;
  String? ja;

  AlternativeTitles({
    this.synonyms,
    this.en,
    this.ja,
  });

  AlternativeTitles copyWith({
    List<String>? synonyms,
    String? en,
    String? ja,
  }) =>
      AlternativeTitles(
        synonyms: synonyms ?? this.synonyms,
        en: en ?? this.en,
        ja: ja ?? this.ja,
      );

  factory AlternativeTitles.fromJson(Map<String, dynamic> json) => AlternativeTitles(
    synonyms: json["synonyms"] == null ? [] : List<String>.from(json["synonyms"]!.map((x) => x)),
    en: json["en"],
    ja: json["ja"],
  );

  Map<String, dynamic> toJson() => {
    "synonyms": synonyms == null ? [] : List<dynamic>.from(synonyms!.map((x) => x)),
    "en": en,
    "ja": ja,
  };
}

class Broadcast {
  String? dayOfTheWeek;
  String? startTime;

  Broadcast({
    this.dayOfTheWeek,
    this.startTime,
  });

  Broadcast copyWith({
    String? dayOfTheWeek,
    String? startTime,
  }) =>
      Broadcast(
        dayOfTheWeek: dayOfTheWeek ?? this.dayOfTheWeek,
        startTime: startTime ?? this.startTime,
      );

  factory Broadcast.fromJson(Map<String, dynamic> json) => Broadcast(
    dayOfTheWeek: json["day_of_the_week"],
    startTime: json["start_time"],
  );

  Map<String, dynamic> toJson() => {
    "day_of_the_week": dayOfTheWeek,
    "start_time": startTime,
  };
}

class Genre {
  int? id;
  String? name;

  Genre({
    this.id,
    this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}

class Picture {
  String? medium;
  String? large;

  Picture({
    this.medium,
    this.large,
  });

  Picture copyWith({
    String? medium,
    String? large,
  }) =>
      Picture(
        medium: medium ?? this.medium,
        large: large ?? this.large,
      );

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toJson() => {
    "medium": medium,
    "large": large,
  };
}

class Recommendation {
  Node? node;
  int? numRecommendations;

  Recommendation({
    this.node,
    this.numRecommendations,
  });

  Recommendation copyWith({
    Node? node,
    int? numRecommendations,
  }) =>
      Recommendation(
        node: node ?? this.node,
        numRecommendations: numRecommendations ?? this.numRecommendations,
      );

  factory Recommendation.fromJson(Map<String, dynamic> json) => Recommendation(
    node: json["node"] == null ? null : Node.fromJson(json["node"]),
    // node: json["node"],
    numRecommendations: json["num_recommendations"],
  );

  Map<String, dynamic> toJson() => {
    "node": node?.toJson(),
    "num_recommendations": numRecommendations,
  };
}


class RelatedAnime {
  Node? node;
  String? relationType;
  String? relationTypeFormatted;

  RelatedAnime({
    this.node,
    this.relationType,
    this.relationTypeFormatted,
  });

  RelatedAnime copyWith({
    Node? node,
    String? relationType,
    String? relationTypeFormatted,
  }) =>
      RelatedAnime(
        node: node ?? this.node,
        relationType: relationType ?? this.relationType,
        relationTypeFormatted: relationTypeFormatted ?? this.relationTypeFormatted,
      );

  factory RelatedAnime.fromJson(Map<String, dynamic> json) => RelatedAnime(
    node: json["node"] == null ? null : Node.fromJson(json["node"]),
    relationType: json["relation_type"],
    relationTypeFormatted: json["relation_type_formatted"],
  );

  Map<String, dynamic> toJson() => {
    "node": node?.toJson(),
    "relation_type": relationType,
    "relation_type_formatted": relationTypeFormatted,
  };
}

class StartSeason {
  int? year;
  String? season;

  StartSeason({
    this.year,
    this.season,
  });

  StartSeason copyWith({
    int? year,
    String? season,
  }) =>
      StartSeason(
        year: year ?? this.year,
        season: season ?? this.season,
      );

  factory StartSeason.fromJson(Map<String, dynamic> json) => StartSeason(
    year: json["year"],
    season: json["season"],
  );

  Map<String, dynamic> toJson() => {
    "year": year,
    "season": season,
  };
}

class Statistics {
  Status? status;
  int? numListUsers;

  Statistics({
    this.status,
    this.numListUsers,
  });

  Statistics copyWith({
    Status? status,
    int? numListUsers,
  }) =>
      Statistics(
        status: status ?? this.status,
        numListUsers: numListUsers ?? this.numListUsers,
      );

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
    status: json["status"] == null ? null : Status.fromJson(json["status"]),
    numListUsers: json["num_list_users"],
  );

  Map<String, dynamic> toJson() => {
    "status": status?.toJson(),
    "num_list_users": numListUsers,
  };
}

class Status {
  String? watching;
  String? completed;
  String? onHold;
  String? dropped;
  String? planToWatch;

  Status({
    this.watching,
    this.completed,
    this.onHold,
    this.dropped,
    this.planToWatch,
  });

  Status copyWith({
    String? watching,
    String? completed,
    String? onHold,
    String? dropped,
    String? planToWatch,
  }) =>
      Status(
        watching: watching ?? this.watching,
        completed: completed ?? this.completed,
        onHold: onHold ?? this.onHold,
        dropped: dropped ?? this.dropped,
        planToWatch: planToWatch ?? this.planToWatch,
      );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    watching: json["watching"],
    completed: json["completed"],
    onHold: json["on_hold"],
    dropped: json["dropped"],
    planToWatch: json["plan_to_watch"],
  );

  Map<String, dynamic> toJson() => {
    "watching": watching,
    "completed": completed,
    "on_hold": onHold,
    "dropped": dropped,
    "plan_to_watch": planToWatch,
  };
}
