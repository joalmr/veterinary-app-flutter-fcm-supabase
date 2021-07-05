// To parse this JSON data, do
//
//     final attentionRegModel = attentionRegModelFromJson(jsonString);

import 'dart:convert';

AttentionRegModel attentionRegModelFromJson(String str) =>
    AttentionRegModel.fromJson(json.decode(str));

String attentionRegModelToJson(AttentionRegModel data) =>
    json.encode(data.toJson());

class AttentionRegModel {
  AttentionRegModel({
    this.message,
    this.result,
  });

  String? message;
  List<AttentionReg>? result;

  factory AttentionRegModel.fromJson(Map<String, dynamic> json) =>
      AttentionRegModel(
        message: json['message'] as String?,
        result: List<AttentionReg>.from(
            json['result'].map((x) => AttentionReg.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class AttentionReg {
  DateTime? attentionDate;
  String? attentionId;
  String? petBreed;
  String? petName;
  String? petPicture;
  String? userName;

  AttentionReg({
    this.attentionDate,
    this.attentionId,
    this.petBreed,
    this.petName,
    this.petPicture,
    this.userName,
  });

  factory AttentionReg.fromJson(Map<String, dynamic> json) => AttentionReg(
        attentionDate: DateTime?.parse(json['attention_date'] as String),
        attentionId: json['attention_id'] as String?,
        petBreed: json['pet_breed'] as String?,
        petName: json['pet_name'] as String?,
        petPicture: json['pet_picture'] as String?,
        userName: json['user_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'attention_date': attentionDate!.toIso8601String(),
        'attention_id': attentionId,
        'pet_breed': petBreed,
        'pet_name': petName,
        'pet_picture': petPicture,
        'user_name': userName,
      };
}
