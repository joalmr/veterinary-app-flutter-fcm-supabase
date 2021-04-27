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

    String message;
    Result result;

    factory StatsServiceModel.fromJson(Map<String, dynamic> json) => StatsServiceModel(
        message: json["message"],
        result: Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "result": result.toJson(),
    };
}

class Result {
    Result({
        this.services,
    });

    List<Service> services;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "services": List<dynamic>.from(services.map((x) => x.toJson())),
    };
}

class Service {
    Service({
        this.name,
        this.value,
    });

    String name;
    int value;

    factory Service.fromJson(Map<String, dynamic> json) => Service(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}
