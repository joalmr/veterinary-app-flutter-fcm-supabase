// To parse this JSON data, do
//
//     final statsSalesDailyModel = statsSalesDailyModelFromJson(jsonString);

import 'dart:convert';

StatsSalesDailyModel statsSalesDailyModelFromJson(String str) =>
    StatsSalesDailyModel.fromJson(json.decode(str));

String statsSalesDailyModelToJson(StatsSalesDailyModel data) =>
    json.encode(data.toJson());

class StatsSalesDailyModel {
  StatsSalesDailyModel({
    this.message,
    this.result,
  });

  String? message;
  Result? result;

  factory StatsSalesDailyModel.fromJson(Map<String, dynamic> json) =>
      StatsSalesDailyModel(
        message: json['message'],
        result: Result.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': result!.toJson(),
      };
}

class Result {
  Result({
    this.salesDay,
  });

  List<SalesDay>? salesDay;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        salesDay: List<SalesDay>.from(
            json['sales_day'].map((x) => SalesDay.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'sales_day': List<dynamic>.from(salesDay!.map((x) => x.toJson())),
      };
}

class SalesDay {
  SalesDay({
    this.name,
    this.value,
  });

  String? name;
  double? value;

  factory SalesDay.fromJson(Map<String, dynamic> json) => SalesDay(
        name: json['name'],
        value: json['value'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };
}
