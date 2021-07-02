// To parse this JSON data, do
//
//     final statCommentModel = statCommentModelFromJson(jsonString);

import 'dart:convert';

List<StatCommentModel> statCommentModelFromJson(String str) =>
    List<StatCommentModel>.from(
        json.decode(str).map((x) => StatCommentModel.fromJson(x)));

String statCommentModelToJson(List<StatCommentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StatCommentModel {
  StatCommentModel({
    this.comment,
    this.date,
    this.petPicture,
    this.stars,
  });

  String? comment;
  DateTime? date;
  String? petPicture;
  int? stars;

  factory StatCommentModel.fromJson(Map<String, dynamic> json) =>
      StatCommentModel(
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        petPicture: json["pet_picture"],
        stars: json["stars"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "date": date!.toIso8601String(),
        "pet_picture": petPicture,
        "stars": stars,
      };
}
