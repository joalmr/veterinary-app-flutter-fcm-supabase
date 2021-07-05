// To parse this JSON data, do
//
//     final statBaseModel = statBaseModelFromJson(jsonString);

import 'dart:convert';

StatBaseModel statBaseModelFromJson(String str) =>
    StatBaseModel.fromJson(json.decode(str));

String statBaseModelToJson(StatBaseModel data) => json.encode(data.toJson());

class StatBaseModel {
  int? nonAttendedPercentage;
  int? dogs;
  int? cats;
  String? stars;
  int? votes;

  StatBaseModel({
    this.nonAttendedPercentage,
    this.dogs,
    this.cats,
    this.stars,
    this.votes,
  });

  factory StatBaseModel.fromJson(Map<String, dynamic> json) => StatBaseModel(
        nonAttendedPercentage: json['nonAttendedPercentage'],
        dogs: json['dogs'],
        cats: json['cats'],
        stars: json['stars'],
        votes: json['votes'],
      );

  Map<String, dynamic> toJson() => {
        'nonAttendedPercentage': nonAttendedPercentage,
        'dogs': dogs,
        'cats': cats,
        'stars': stars,
        'votes': votes,
      };
}
