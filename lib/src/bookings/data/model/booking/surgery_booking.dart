// To parse this JSON data, do
//
//     final surgeryBooking = surgeryBookingFromJson(jsonString);

import 'dart:convert';

SurgeryBooking surgeryBookingFromJson(String str) =>
    SurgeryBooking.fromJson(json.decode(str));

String surgeryBookingToJson(SurgeryBooking data) => json.encode(data.toJson());

class SurgeryBooking {
  SurgeryBooking({
    this.amount,
    this.recommendations,
  });

  double? amount;
  String? recommendations;

  factory SurgeryBooking.fromJson(Map<String, dynamic> json) => SurgeryBooking(
        amount: json['amount'] ?? 0.0,
        recommendations: json['recommendations'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'recommendations': recommendations,
      };
}
