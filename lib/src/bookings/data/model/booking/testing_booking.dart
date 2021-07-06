// To parse this JSON data, do
//
//     final testingBooking = testingBookingFromJson(jsonString);

import 'dart:convert';

TestingBooking testingBookingFromJson(String str) =>
    TestingBooking.fromJson(json.decode(str));

String testingBookingToJson(TestingBooking data) => json.encode(data.toJson());

class TestingBooking {
  TestingBooking({
    this.amount,
    this.tests,
    this.recommendations,
  });

  double? amount;
  List<Test>? tests;
  String? recommendations;

  factory TestingBooking.fromJson(Map<String, dynamic> json) => TestingBooking(
        amount: json['amount'] ?? 0.0,
        tests: List<Test>.from(json['tests'].map((x) => Test.fromJson(x))),
        recommendations: json['recommendations'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'tests': List<dynamic>.from(tests?.map((x) => x.toJson()) ?? []),
        'recommendations': recommendations,
      };
}

class Test {
  Test({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
