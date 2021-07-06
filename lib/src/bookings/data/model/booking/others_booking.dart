// To parse this JSON data, do
//
//     final othersBooking = othersBookingFromJson(jsonString);

import 'dart:convert';

OthersBooking othersBookingFromJson(String str) =>
    OthersBooking.fromJson(json.decode(str));

String othersBookingToJson(OthersBooking data) => json.encode(data.toJson());

class OthersBooking {
  OthersBooking({
    this.amount,
    this.others,
    this.recommendations,
  });

  double? amount;
  List<OtherServ>? others;
  String? recommendations;

  factory OthersBooking.fromJson(Map<String, dynamic> json) => OthersBooking(
        amount: json['amount'] ?? 0.0,
        others: List<OtherServ>.from(
            json['others'].map((x) => OtherServ.fromJson(x))),
        recommendations: json['recommendations'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'others': List<dynamic>.from(others?.map((x) => x.toJson()) ?? []),
        'recommendations': recommendations,
      };
}

List<OtherServ> otherServModelFromJson(String str) =>
    List<OtherServ>.from(json.decode(str).map((x) => OtherServ.fromJson(x)));

String otherServModelToJson(List<OtherServ> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OtherServ {
  OtherServ({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory OtherServ.fromJson(Map<String, dynamic> json) => OtherServ(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
