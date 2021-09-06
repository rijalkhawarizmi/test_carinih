// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

UsersModel usersModelFromJson(String str) =>
    UsersModel.fromJson(json.decode(str));

String usersModelToJson(UsersModel data) => json.encode(data.toJson());

class UsersModel {
  UsersModel({
    this.gender,
    this.name,
  });

  String? gender;
  Name? name;

  factory UsersModel.fromJson(Map<dynamic, dynamic> json) => UsersModel(
        gender: json["gender"],
        name: Name.fromJson(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name!.toJson(),
      };
}

class Name {
  Name({
    this.title,
    this.first,
    this.last,
  });

  String? title;
  String? first;
  String? last;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}
