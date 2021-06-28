// To parse this JSON data, do
//
//     final consultationBooking = consultationBookingFromJson(jsonString);

import 'dart:convert';

ConsultationBooking consultationBookingFromJson(String str) =>
    ConsultationBooking.fromJson(json.decode(str));

String consultationBookingToJson(ConsultationBooking data) =>
    json.encode(data.toJson());

class ConsultationBooking {
  ConsultationBooking({
    this.amount,
    this.anamnesis,
    this.diagnoses,
    this.recommendations,
  });

  double amount;
  String anamnesis;
  List<Diagnosis> diagnoses;
  String recommendations;

  factory ConsultationBooking.fromJson(Map<String, dynamic> json) =>
      ConsultationBooking(
        amount: json["amount"].toDouble() ?? 0.0,
        anamnesis: json["anamnesis"],
        diagnoses: List<Diagnosis>.from(
            json["diagnoses"].map((x) => Diagnosis.fromJson(x))),
        recommendations: json["recommendations"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "anamnesis": anamnesis,
        "diagnoses": List<dynamic>.from(diagnoses.map((x) => x.toJson())),
        "recommendations": recommendations,
      };
}

List<Diagnosis> diagnosesModelFromJson(String str) =>
    List<Diagnosis>.from(json.decode(str).map((x) => Diagnosis.fromJson(x)));

String diagnosesModelToJson(List<Diagnosis> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Diagnosis {
  Diagnosis({
    this.id,
    this.name,
    this.condition,
  });

  int id;
  String name;
  String condition;

  factory Diagnosis.fromJson(Map<String, dynamic> json) => Diagnosis(
        id: json["id"],
        name: json["name"],
        condition: json["condition"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "condition": condition,
      };
}
