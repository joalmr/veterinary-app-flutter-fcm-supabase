// To parse this JSON data, do
//
//     final statsServiceModel = statsServiceModelFromJson(jsonString);

import 'dart:convert';

StatsServiceModel statsServiceModelFromJson(String str) => StatsServiceModel.fromJson(json.decode(str));

String statsServiceModelToJson(StatsServiceModel data) => json.encode(data.toJson());

class StatsServiceModel {
    StatsServiceModel({
        this.message,
        this.result,
    });

    String? message;
    Result? result;

    factory StatsServiceModel.fromJson(Map<String, dynamic> json) => StatsServiceModel(
        message: json["message"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "result": result!.toJson(),
    };
}

class Result {
    Result({
        this.services,
    });

    List<Services>? services;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        services: List<Services>.from(json["services"].map((x) => Services.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
    };
}

class Services {
    Services({
        this.name,
        this.value,
    });

    String? name;
    int? value;

    factory Services.fromJson(Map<String, dynamic> json) => Services(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}
