class AnimeModel {
  Node? node;
  Ranking? ranking;

  AnimeModel({
    this.node,
    this.ranking,
  });

  AnimeModel copyWith({
    Node? node,
    Ranking? ranking,
  }) =>
      AnimeModel(
        node: node ?? this.node,
        ranking: ranking ?? this.ranking,
      );

  factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
    node: json["node"] == null ? null : Node.fromJson(json["node"]),
    ranking: json["ranking"] == null ? null : Ranking.fromJson(json["ranking"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node?.toJson(),
    "ranking": ranking?.toJson(),
  };

  @override
  String toString() {
    return 'AnimeModel(node: $node, ranking: $ranking)';
  }
}

class Node {
  int? id;
  String? title;
  MainPicture? mainPicture;

  Node({this.id, this.title, this.mainPicture});

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json['id'],
    title: json['title'],
    mainPicture: json['main_picture'] == null ? null : MainPicture.fromJson(json['main_picture']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'main_picture': mainPicture?.toJson(),
  };

  @override
  String toString() {
    return 'Node(id: $id, title: $title, mainPicture: $mainPicture)';
  }
}

class MainPicture {
  String? medium;
  String? large;

  MainPicture({this.medium, this.large});

  factory MainPicture.fromJson(Map<String, dynamic> json) => MainPicture(
    medium: json['medium'],
    large: json['large'],
  );

  Map<String, dynamic> toJson() => {
    'medium': medium,
    'large': large,
  };

  @override
  String toString() {
    return 'MainPicture(medium: $medium, large: $large)';
  }
}

class Ranking {
  int? rank;

  Ranking({this.rank});

  factory Ranking.fromJson(Map<String, dynamic> json) => Ranking(
    rank: json['rank'],
  );

  Map<String, dynamic> toJson() => {
    'rank': rank,
  };

  @override
  String toString() {
    return 'Ranking(rank: $rank)';
  }
}
