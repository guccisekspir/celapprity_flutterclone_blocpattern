// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  String id;
  String username;
  String email;
  String firstName;
  String middleName;
  String lastName;
  String image;
  String lang;
  String about;
  String accountType;
  String twitter;
  String instagram;
  String youtube;
  String facebook;
  bool isOnline;
  List<String> professions;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.middleName,
    this.lastName,
    this.image,
    this.lang,
    this.about,
    this.accountType,
    this.twitter,
    this.instagram,
    this.youtube,
    this.facebook,
    this.isOnline,
    this.professions,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    username: json["username"] == null ? null : json["username"],
    email: json["email"] == null ? null : json["email"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    middleName: json["middleName"] == null ? null : json["middleName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    image: json["image"] == null ? null : json["image"],
    lang: json["lang"] == null ? null : json["lang"],
    about: json["about"] == null ? null : json["about"],
    accountType: json["accountType"] == null ? null : json["accountType"],
    twitter: json["twitter"] == null ? null : json["twitter"],
    instagram: json["instagram"] == null ? null : json["instagram"],
    youtube: json["youtube"] == null ? null : json["youtube"],
    facebook: json["facebook"] == null ? null : json["facebook"],
    isOnline: json["isOnline"] == null ? null : json["isOnline"],
    professions: json["professions"] == null ? null : List<String>.from(json["professions"].map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "username": username == null ? null : username,
    "email": email == null ? null : email,
    "firstName": firstName == null ? null : firstName,
    "middleName": middleName == null ? null : middleName,
    "lastName": lastName == null ? null : lastName,
    "image": image == null ? null : image,
    "lang": lang == null ? null : lang,
    "about": about == null ? null : about,
    "accountType": accountType == null ? null : accountType,
    "twitter": twitter == null ? null : twitter,
    "instagram": instagram == null ? null : instagram,
    "youtube": youtube == null ? null : youtube,
    "facebook": facebook == null ? null : facebook,
    "isOnline": isOnline == null ? null : isOnline,
    "professions": professions == null ? null : List<dynamic>.from(professions.map((x) => x)),
    "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
  };
}
