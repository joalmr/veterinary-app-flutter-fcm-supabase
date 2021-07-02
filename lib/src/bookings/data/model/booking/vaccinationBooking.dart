// To parse this JSON data, do
//
//     final vaccinationBooking = vaccinationBookingFromJson(jsonString);

import 'dart:convert';

VaccinationBooking vaccinationBookingFromJson(String str) =>
    VaccinationBooking.fromJson(json.decode(str));

String vaccinationBookingToJson(VaccinationBooking data) =>
    json.encode(data.toJson());

class VaccinationBooking {
  VaccinationBooking({
    this.amount,
    this.vaccines,
    this.recommendations,
  });

  double? amount;
  List<Vaccine>? vaccines;
  String? recommendations;

  factory VaccinationBooking.fromJson(Map<String, dynamic> json) =>
      VaccinationBooking(
        amount: json["amount"].toDouble() ?? 0.0,
        vaccines: List<Vaccine>.from(
            json["vaccines"].map((x) => Vaccine.fromJson(x))),
        recommendations: json["recommendations"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "vaccines": List<dynamic>.from(vaccines!.map((x) => x.toJson())),
        "recommendations": recommendations,
      };
}

List<Vaccine> vaccinesModelFromJson(String str) =>
    List<Vaccine>.from(json.decode(str).map((x) => Vaccine.fromJson(x)));

String vaccinesModelToJson(List<Vaccine> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vaccine {
  Vaccine({
    this.id,
    this.name,
    this.laboratory,
    this.antigens,
  });

  int? id;
  String? name;
  String? laboratory;
  List<String>? antigens;

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        id: json["id"],
        name: json["name"],
        laboratory: json["laboratory"],
        antigens: List<String>.from(json["antigens"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "laboratory": laboratory,
        "antigens": List<dynamic>.from(antigens!.map((x) => x)),
      };
}
