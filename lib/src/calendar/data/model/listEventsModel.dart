// To parse this JSON data, do
//
//     final listEventsModel = listEventsModelFromJson(jsonString);

import 'dart:convert';

ListEventsModel listEventsModelFromJson(String str) => ListEventsModel.fromJson(json.decode(str));

String listEventsModelToJson(ListEventsModel data) => json.encode(data.toJson());

class ListEventsModel {
    ListEventsModel({
        this.message,
        this.result,
    });

    String? message;
    Map<String, List<Result>>? result;

    factory ListEventsModel.fromJson(Map<String, dynamic> json) => ListEventsModel(
        message: json["message"],
        result: Map.from(json["result"]).map((k, v) => MapEntry<String, List<Result>>(k, List<Result>.from(v.map((x) => Result.fromJson(x))))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "result": Map.from(result!).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
    };
}

class Result {
    Result({
        this.id,
        this.date,
        this.description,
        this.members,
        this.time,
        this.title,
    });

    String? id;
    DateTime? date;
    String? description;
    String? members;
    String? time;
    String? title;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        date: DateTime.parse(json["date"]),
        description: json["description"],
        members: json["members"],
        time: json["time"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "description": description,
        "members": members,
        "time": time,
        "title": title,
    };
}
