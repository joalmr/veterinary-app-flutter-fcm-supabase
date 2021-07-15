// To parse this JSON data, do
//
//     final groomingBooking = groomingBookingFromJson(jsonString);

import 'dart:convert';

GroomingBooking groomingBookingFromJson(String str) =>
    GroomingBooking.fromJson(json.decode(str));

String groomingBookingToJson(GroomingBooking data) =>
    json.encode(data.toJson());

class GroomingBooking {
  GroomingBooking({
    this.amount,
    this.groomings,
    this.groomingIds,
    this.recommendations,
  });

  double? amount;
  List<String>? groomings;
  List<int>? groomingIds;
  String? recommendations;

  factory GroomingBooking.fromJson(Map<String, dynamic> json) =>
      GroomingBooking(
        amount: json['amount'].toDouble() ?? 0.0,
        groomings: List<String>.from(json['groomings'].map((x) => x)),
        groomingIds: List<int>.from(json['grooming_ids'].map((x) => x)),
        recommendations: json['recommendations'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'groomings':
            List<dynamic>.from(groomingIds!.map((x) => x)), //groomingIds
        'recommendations': recommendations,
      };
}
