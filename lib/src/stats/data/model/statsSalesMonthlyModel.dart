// To parse this JSON data, do
//
//     final statsSalesMonthlyModel = statsSalesMonthlyModelFromJson(jsonString);

import 'dart:convert';

StatsSalesMonthlyModel statsSalesMonthlyModelFromJson(String str) => StatsSalesMonthlyModel.fromJson(json.decode(str));

String statsSalesMonthlyModelToJson(StatsSalesMonthlyModel data) => json.encode(data.toJson());

class StatsSalesMonthlyModel {
    StatsSalesMonthlyModel({
        this.message,
        this.result,
    });

    String message;
    Result result;

    factory StatsSalesMonthlyModel.fromJson(Map<String, dynamic> json) => StatsSalesMonthlyModel(
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
        this.salesMonth,
    });

    List<SalesMonth> salesMonth;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        salesMonth: List<SalesMonth>.from(json["sales_month"].map((x) => SalesMonth.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "sales_month": List<dynamic>.from(salesMonth.map((x) => x.toJson())),
    };
}

class SalesMonth {
    SalesMonth({
        this.name,
        this.value,
    });

    String name;
    int value;

    factory SalesMonth.fromJson(Map<String, dynamic> json) => SalesMonth(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}
