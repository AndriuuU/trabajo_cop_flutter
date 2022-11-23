import 'dart:convert';

class User {
  User({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<DataUser> data;
  String message;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
        success: json["success"],
        data: List<DataUser>.from(json["data"].map((x) => DataUser.fromMap(x))),
        message: json["message"],
      );
}

class DataUser {
  DataUser({
    this.id,
    this.name,
    this.surname,
    this.cicleId,
    this.actived,
    this.email,
    this.type,
    this.numOffersApplied,
    this.createdAt,
  });

  int? id;
  String? name;
  String? surname;
  int? cicleId;
  int? actived;
  String? email;
  String? type;
  int? numOffersApplied;
  String? createdAt;

  factory DataUser.fromJson(String str) => DataUser.fromMap(json.decode(str));
  factory DataUser.fromMap(Map<String, dynamic> json) => DataUser(
        id: json["id"],
        name: json["name"],
        surname: json["surname"],
        cicleId: json["cicleId"],
        actived: json["actived"],
        email: json["email"],
        type: json["type"],
        numOffersApplied: json["numOffersApplied"],
        createdAt: json["createdAt"],
      );
}
