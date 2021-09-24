// To parse this JSON data, do
//
//     final servicesStatsModel = servicesStatsModelFromJson(jsonString);

import 'dart:convert';

ServicesStatsModel servicesStatsModelFromJson(String str) =>
    ServicesStatsModel.fromJson(json.decode(str));

String servicesStatsModelToJson(ServicesStatsModel data) =>
    json.encode(data.toJson());

class ServicesStatsModel {
  ServicesStatsModel({
    this.message,
    this.result,
  });

  String? message;
  Result? result;

  factory ServicesStatsModel.fromJson(Map<String, dynamic> json) =>
      ServicesStatsModel(
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
    this.amount,
    this.count,
  });

  double? amount;
  int? count;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        amount: json["amount"].toDouble(),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "count": count,
      };
}
