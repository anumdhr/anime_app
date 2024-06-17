import 'package:anime_fever/models/anime_details_model.dart';

class Node {
  int? id;
  String? title;
  Picture? mainPicture;

  Node({
    this.id,
    this.title,
    this.mainPicture,
  });

  Node copyWith({
    int? id,
    String? title,
    Picture? mainPicture,
  }) =>
      Node(
        id: id ?? this.id,
        title: title ?? this.title,
        mainPicture: mainPicture ?? this.mainPicture,
      );

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"],
    title: json["title"],
    mainPicture: json["main_picture"] == null ? null : Picture.fromJson(json["main_picture"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "main_picture": mainPicture?.toJson(),
  };
}
