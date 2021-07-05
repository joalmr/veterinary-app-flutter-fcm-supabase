import 'dart:convert';
import 'consultation_booking.dart';
import 'deworming_booking.dart';
import 'others_booking.dart';
import 'surgery_booking.dart';
import 'vaccination_booking.dart';

GeneralBooking generalBookingFromJson(String str) =>
    GeneralBooking.fromJson(json.decode(str) as Map<String, String>);

String generalBookingToJson(GeneralBooking data) => json.encode(data.toJson());

class GeneralBooking {
  GeneralBooking({
    this.attentionId,
    required this.consultation,
    required this.deworming,
    required this.grooming,
    required this.other,
    required this.surgery,
    required this.testing,
    required this.vaccination,
    required this.total,
  });

  String? attentionId;
  ConsultationBooking? consultation;
  DewormingBooking? deworming;
  dynamic grooming;
  OthersBooking? other;
  SurgeryBooking? surgery;
  dynamic testing;
  VaccinationBooking? vaccination;
  double total;

  factory GeneralBooking.fromJson(Map<String, dynamic> json) => GeneralBooking(
        attentionId: json['attention_id'],
        consultation: json['consultation'] == null
            ? null
            : ConsultationBooking.fromJson(json['consultation']),
        deworming: json['deworming'] == null
            ? null
            : DewormingBooking.fromJson(json['deworming']),
        grooming: json['grooming'],
        other: json['other'] == null
            ? null
            : OthersBooking.fromJson(json['other']),
        surgery: json['surgery'] == null
            ? null
            : SurgeryBooking.fromJson(json['surgery']),
        testing: json['testing'],
        vaccination: json['vaccination'] == null
            ? null
            : VaccinationBooking.fromJson(json['vaccination']),
        total: json['total'],
      );

  Map<String, dynamic> toJson() => {
        'attention_id': attentionId,
        'consultation': consultation?.toJson() ?? null,
        'deworming': deworming?.toJson() ?? null,
        'grooming': grooming,
        'other': other?.toJson() ?? null,
        'surgery': surgery?.toJson() ?? null,
        'testing': testing,
        'vaccination': vaccination?.toJson() ?? null,
        'total': total,
      };
}
