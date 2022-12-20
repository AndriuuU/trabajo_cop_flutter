import 'dart:convert';

class Articles {
  Articles({
    required this.id,
    required this.title,
    required this.description,
    required this.img,
  });

  int id;
  String title;
  String description;
  String img;

  factory Articles.fromJson(String str) => Articles.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Articles.fromMap(Map<String, dynamic> json) => Articles(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      img: json["img"]);

  Map<String, dynamic> toMap() =>
      {"id": id, "title": title, "description": description, "img": img};
}
