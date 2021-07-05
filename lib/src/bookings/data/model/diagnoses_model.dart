// To parse this JSON data, do
//
//     final diagnosesModel = diagnosesModelFromJson(jsonString);

import 'dart:convert';

List<DiagnosesModel> diagnosesModelFromJson(String str) =>
    List<DiagnosesModel>.from(
        json.decode(str).map((x) => DiagnosesModel.fromJson(x)));

String diagnosesModelToJson(List<DiagnosesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DiagnosesModel {
  int? id;
  String? name;
  int? diagnoses;

  DiagnosesModel({
    this.id,
    this.name,
    this.diagnoses,
  });

  factory DiagnosesModel.fromJson(Map<String, dynamic> json) => DiagnosesModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        diagnoses: json['diagnoses'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'diagnoses': diagnoses,
      };
}
