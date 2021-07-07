// To parse this JSON data, do
//
//     final petClientHistory = petClientHistoryFromJson(jsonString);

import 'dart:convert';

PetClientHistory petClientHistoryFromJson(String str) =>
    PetClientHistory.fromJson(json.decode(str));

String petClientHistoryToJson(PetClientHistory data) =>
    json.encode(data.toJson());

class PetClientHistory {
  PetClientHistory({
    this.message,
    this.result,
  });

  String? message;
  List<Result>? result;

  factory PetClientHistory.fromJson(Map<String, dynamic> json) =>
      PetClientHistory(
        message: json['message'],
        result:
            List<Result>.from(json['result'].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.attentionId,
    this.attentionAmount,
    this.attentionBonification,
    this.attentionDate,
    this.establishmentId,
    this.establishment,
    this.establishmentLogo,
    this.weight,
    this.heartRhythm,
    this.temperature,
    this.bodyCondition,
    this.createdAt,
    this.orderDate,
    this.amount,
    this.nextdate,
    this.reason,
    this.details,
  });

  String? attentionId;
  double? attentionAmount;
  int? attentionBonification;
  DateTime? attentionDate;
  String? establishmentId;
  String? establishment;
  String? establishmentLogo;
  double? weight;
  dynamic heartRhythm;
  dynamic temperature;
  String? bodyCondition;
  String? createdAt;
  DateTime? orderDate;
  double? amount;
  dynamic nextdate;
  dynamic reason;
  dynamic details;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        attentionId: json['attention_id'],
        attentionAmount: json['attention_amount'].toDouble() ?? 0,
        attentionBonification: json['attention_bonification'],
        attentionDate: DateTime.parse(json['attention_date']),
        establishmentId: json['establishment_id'],
        establishment: json['establishment'],
        establishmentLogo: json['establishment_logo'],
        weight: json['weight'].toDouble(),
        heartRhythm: json['heart_rhythm'],
        temperature: json['temperature'],
        bodyCondition: json['body_condition'],
        createdAt: json['created_at'],
        orderDate: DateTime.parse(json['order_date']),
        amount: json['amount'].toDouble(),
        nextdate: json['nextdate'],
        reason: json['reason'],
        details: json['details'],
      );

  Map<String, dynamic> toJson() => {
        'attention_id': attentionId,
        'attention_amount': attentionAmount,
        'attention_bonification': attentionBonification,
        'attention_date': attentionDate!.toIso8601String(),
        'establishment_id': establishmentId,
        'establishment': establishment,
        'establishment_logo': establishmentLogo,
        'weight': weight,
        'heart_rhythm': heartRhythm,
        'temperature': temperature,
        'body_condition': bodyCondition,
        'created_at': createdAt,
        'order_date': orderDate!.toIso8601String(),
        'amount': amount,
        'nextdate': nextdate,
        'reason': reason,
        'details': details.toJson(),
      };
}
