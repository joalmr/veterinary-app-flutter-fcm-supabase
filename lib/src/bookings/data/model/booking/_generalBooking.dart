// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'consultationBooking.dart';
import 'dewormingBooking.dart';
import 'othersBooking.dart';
import 'surgeryBooking.dart';
import 'vaccinationBooking.dart';

GeneralBooking generalBookingFromJson(String str) => GeneralBooking.fromJson(json.decode(str));

String generalBookingToJson(GeneralBooking data) => json.encode(data.toJson());

class GeneralBooking {
    GeneralBooking({
        this.attentionId,
        this.consultation,
        this.deworming,
        this.grooming,
        this.other,
        this.surgery,
        this.testing,
        this.vaccination,
        this.total,
    });

    String attentionId;
    ConsultationBooking consultation;
    DewormingBooking deworming;
    dynamic grooming;
    OthersBooking other;
    SurgeryBooking surgery;
    dynamic testing;
    VaccinationBooking vaccination;
    double total;

    factory GeneralBooking.fromJson(Map<String, dynamic> json) => GeneralBooking(
        attentionId: json["attention_id"],
        consultation: ConsultationBooking.fromJson(json["consultation"]),
        deworming: DewormingBooking.fromJson(json["deworming"]),
        grooming: json["grooming"],
        other: OthersBooking.fromJson(json["other"]),
        surgery: SurgeryBooking.fromJson(json["surgery"]),
        testing: json["testing"],
        vaccination: VaccinationBooking.fromJson(json["vaccination"]),
        total: json["total"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "attention_id": attentionId,
        "consultation": consultation.toJson(),
        "deworming": deworming.toJson(),
        "grooming": grooming,
        "other": other.toJson(),
        "surgery": surgery.toJson(),
        "testing": testing,
        "vaccination": vaccination.toJson(),
        "total": total,
    };
}
