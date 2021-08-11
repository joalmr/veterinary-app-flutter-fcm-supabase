// To parse this JSON data, do
//
//     final attentionDetailModel = attentionDetailModelFromJson(jsonString);

import 'dart:convert';

AttentionDetailModel attentionDetailModelFromJson(String str) =>
    AttentionDetailModel.fromJson(json.decode(str));

String attentionDetailModelToJson(AttentionDetailModel data) =>
    json.encode(data.toJson());

class AttentionDetailModel {
  AttentionDetailModel({
    this.message,
    this.result,
  });

  String? message;
  ResultAttentionDetail? result;

  factory AttentionDetailModel.fromJson(Map<String, dynamic> json) =>
      AttentionDetailModel(
        message: json['message'],
        result: ResultAttentionDetail.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': result!.toJson(),
      };
}

class ResultAttentionDetail {
  ResultAttentionDetail({
    this.attentionAmount,
    this.attentionDate,
    this.attentionId,
    this.attentionDetails,
    this.petBreed,
    this.petId,
    this.petName,
    this.petPicture,
    this.userName,
  });

  String? attentionAmount;
  DateTime? attentionDate;
  String? attentionId;
  dynamic attentionDetails; //AttentionDetails?
  String? petBreed;
  String? petId;
  String? petName;
  String? petPicture;
  String? userName;

  factory ResultAttentionDetail.fromJson(Map<String, dynamic> json) =>
      ResultAttentionDetail(
        attentionAmount: json['attention_amount'] ?? '0',
        attentionDate: DateTime.parse(json['attention_date']),
        attentionId: json['attention_id'],
        attentionDetails: json[
            'attention_details'], // AttentionDetails.fromJson(json['attention_details']),
        petBreed: json['pet_breed'],
        petId: json['pet_id'],
        petName: json['pet_name'],
        petPicture: json['pet_picture'],
        userName: json['user_name'],
      );

  Map<String, dynamic> toJson() => {
        'attention_date': attentionDate!.toIso8601String(),
        'attention_id': attentionId,
        // 'attention_details': attentionDetails!.toJson(),
        'pet_breed': petBreed,
        'pet_id': petId,
        'pet_name': petName,
        'pet_picture': petPicture,
        'user_name': userName,
      };
}

class AttentionDetails {
  AttentionDetails({
    this.consultation,
    this.deworming,
    this.grooming,
    this.other,
    this.surgery,
    this.testing,
    this.vaccination,
  });

  Consultation? consultation;
  Deworming? deworming;
  Grooming? grooming;
  AttentionDetailsOther? other;
  Surgery? surgery;
  Testing? testing;
  Vaccination? vaccination;

  factory AttentionDetails.fromJson(Map<String, dynamic> json) =>
      AttentionDetails(
        consultation: Consultation.fromJson(json['consultation']),
        deworming: Deworming.fromJson(json['deworming']),
        grooming: Grooming.fromJson(json['grooming']),
        other: AttentionDetailsOther.fromJson(json['other']),
        surgery: Surgery.fromJson(json['surgery']),
        testing: Testing.fromJson(json['testing']),
        vaccination: Vaccination.fromJson(json['vaccination']),
      );

  Map<String, dynamic> toJson() => {
        'consultation': consultation!.toJson(),
        'deworming': deworming!.toJson(),
        'grooming': grooming!.toJson(),
        'other': other!.toJson(),
        'surgery': surgery!.toJson(),
        'testing': testing!.toJson(),
        'vaccination': vaccination!.toJson(),
      };
}

class Consultation {
  Consultation({
    this.amount,
    this.anamnesis,
    this.diagnoses,
    this.recommendations,
    this.type,
  });

  double? amount;
  String? anamnesis;
  List<Diagnosis>? diagnoses;
  String? recommendations;
  String? type;

  factory Consultation.fromJson(Map<String, dynamic> json) => Consultation(
        amount: json['amount'].toDouble(),
        anamnesis: json['anamnesis'],
        diagnoses: List<Diagnosis>.from(
            json['diagnoses'].map((x) => Diagnosis.fromJson(x))),
        recommendations: json['recommendations'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'anamnesis': anamnesis,
        'diagnoses': List<dynamic>.from(diagnoses!.map((x) => x.toJson())),
        'recommendations': recommendations,
        'type': type,
      };
}

class Diagnosis {
  Diagnosis({
    this.id,
    this.name,
    this.condition,
  });

  int? id;
  String? name;
  dynamic condition;

  factory Diagnosis.fromJson(Map<String, dynamic> json) => Diagnosis(
        id: json['id'],
        name: json['name'],
        condition: json['condition'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'condition': condition,
      };
}

class Deworming {
  Deworming({
    this.amount,
    this.dewormers,
    this.recommendations,
  });

  double? amount;
  List<Dewormer>? dewormers;
  String? recommendations;

  factory Deworming.fromJson(Map<String, dynamic> json) => Deworming(
        amount: json['amount'].toDouble(),
        dewormers: List<Dewormer>.from(
            json['dewormers'].map((x) => Dewormer.fromJson(x))),
        recommendations: json['recommendations'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'dewormers': List<dynamic>.from(dewormers!.map((x) => x.toJson())),
        'recommendations': recommendations,
      };
}

class Dewormer {
  Dewormer({
    this.id,
    this.name,
    this.laboratory,
    this.types,
    this.antigens,
  });

  int? id;
  String? name;
  String? laboratory;
  List<String>? types;
  List<String>? antigens;

  factory Dewormer.fromJson(Map<String, dynamic> json) => Dewormer(
        id: json['id'],
        name: json['name'],
        laboratory: json['laboratory'],
        types: json['types'] == null
            ? null
            : List<String>.from(json['types'].map((x) => x)),
        antigens: json['antigens'] == null
            ? null
            : List<String>.from(json['antigens'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'laboratory': laboratory,
        'types':
            types == null ? null : List<dynamic>.from(types!.map((x) => x)),
        'antigens': antigens == null
            ? null
            : List<dynamic>.from(antigens!.map((x) => x)),
      };
}

class Grooming {
  Grooming({
    this.amount,
    this.groomings,
    this.groomingIds,
    this.recommendations,
  });

  double? amount;
  List<String>? groomings;
  List<int>? groomingIds;
  String? recommendations;

  factory Grooming.fromJson(Map<String, dynamic> json) => Grooming(
        amount: json['amount'].toDouble(),
        groomings: List<String>.from(json['groomings'].map((x) => x)),
        groomingIds: List<int>.from(json['grooming_ids'].map((x) => x)),
        recommendations: json['recommendations'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'groomings': List<dynamic>.from(groomings!.map((x) => x)),
        'grooming_ids': List<dynamic>.from(groomingIds!.map((x) => x)),
        'recommendations': recommendations,
      };
}

class AttentionDetailsOther {
  AttentionDetailsOther({
    this.amount,
    this.others,
    this.recommendations,
  });

  double? amount;
  List<OtherElement>? others;
  dynamic recommendations;

  factory AttentionDetailsOther.fromJson(Map<String, dynamic> json) =>
      AttentionDetailsOther(
        amount: json['amount'].toDouble(),
        others: List<OtherElement>.from(
            json['others'].map((x) => OtherElement.fromJson(x))),
        recommendations: json['recommendations'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'others': List<dynamic>.from(others!.map((x) => x.toJson())),
        'recommendations': recommendations,
      };
}

class OtherElement {
  OtherElement({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory OtherElement.fromJson(Map<String, dynamic> json) => OtherElement(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}

class Surgery {
  Surgery({
    this.amount,
    this.recommendations,
  });

  double? amount;
  dynamic recommendations;

  factory Surgery.fromJson(Map<String, dynamic> json) => Surgery(
        amount: json['amount'].toDouble(),
        recommendations: json['recommendations'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'recommendations': recommendations,
      };
}

class Testing {
  Testing({
    this.amount,
    this.tests,
    this.recommendations,
  });

  double? amount;
  List<OtherElement>? tests;
  String? recommendations;

  factory Testing.fromJson(Map<String, dynamic> json) => Testing(
        amount: json['amount'].toDouble(),
        tests: List<OtherElement>.from(
            json['tests'].map((x) => OtherElement.fromJson(x))),
        recommendations: json['recommendations'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'tests': List<dynamic>.from(tests!.map((x) => x.toJson())),
        'recommendations': recommendations,
      };
}

class Vaccination {
  Vaccination({
    this.amount,
    this.vaccines,
    this.recommendations,
  });

  double? amount;
  List<Dewormer>? vaccines;
  dynamic recommendations;

  factory Vaccination.fromJson(Map<String, dynamic> json) => Vaccination(
        amount: json['amount'].toDouble(),
        vaccines: List<Dewormer>.from(
            json['vaccines'].map((x) => Dewormer.fromJson(x))),
        recommendations: json['recommendations'],
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'vaccines': List<dynamic>.from(vaccines!.map((x) => x.toJson())),
        'recommendations': recommendations,
      };
}
