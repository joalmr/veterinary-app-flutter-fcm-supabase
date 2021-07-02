// To parse this JSON data, do
//
//     final statsUserModel = statsUserModelFromJson(jsonString);

import 'dart:convert';

StatsUserModel statsUserModelFromJson(String str) => StatsUserModel.fromJson(json.decode(str));

String statsUserModelToJson(StatsUserModel data) => json.encode(data.toJson());

class StatsUserModel {
    StatsUserModel({
        this.message,
        this.result,
    });

    String? message;
    Result? result;

    factory StatsUserModel.fromJson(Map<String, dynamic> json) => StatsUserModel(
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
        this.usersMonth,
    });

    List<UsersMonth>? usersMonth;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        usersMonth: List<UsersMonth>.from(json["users_month"].map((x) => UsersMonth.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users_month": List<dynamic>.from(usersMonth!.map((x) => x.toJson())),
    };
}

class UsersMonth {
    UsersMonth({
        this.name,
        this.value,
    });

    String? name;
    int? value;

    factory UsersMonth.fromJson(Map<String, dynamic> json) => UsersMonth(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}
