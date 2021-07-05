// To parse this JSON data, do
//
//     final listNextdateModel = listNextdateModelFromJson(jsonString);

import 'dart:convert';

ListNextdateModel listNextdateModelFromJson(String str) =>
    ListNextdateModel.fromJson(json.decode(str));

String listNextdateModelToJson(ListNextdateModel data) =>
    json.encode(data.toJson());

class ListNextdateModel {
  ListNextdateModel({
    this.message,
    this.result,
  });

  String? message;
  Map<String, List<Result>>? result;

  factory ListNextdateModel.fromJson(Map<String, dynamic> json) =>
      ListNextdateModel(
        message: json['message'] as String?,
        result: Map.from(json['result']).map((k, v) =>
            MapEntry<String, List<Result>>(
                k, List<Result>.from(v.map((x) => Result.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': Map.from(result!).map((k, v) => MapEntry<String, dynamic>(
            k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class Result {
  Result({
    this.petPicture,
    this.petBreed,
    this.petName,
    this.userName,
    this.userPhone,
    this.nextdate,
    this.reason,
    this.type,
  });

  String? petPicture;
  String? petBreed;
  String? petName;
  String? userName;
  String? userPhone;
  DateTime? nextdate;
  String? reason;
  String? type;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        petPicture: json['pet_picture'] as String?,
        petBreed: json['pet_breed'] as String?,
        petName: json['pet_name'] as String?,
        userName: json['user_name'] as String?,
        userPhone: json['user_phone'] as String?,
        nextdate: DateTime?.parse(json['nextdate'] as String),
        reason: json['reason'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pet_picture': petPicture,
        'pet_breed': petBreed,
        'pet_name': petName,
        'user_name': userName,
        'user_phone': userPhone,
        'nextdate':
            '''${nextdate!.year.toString().padLeft(4, '0')}-${nextdate!.month.toString().padLeft(2, '0')}-${nextdate!.day.toString().padLeft(2, '0')}''',
        'reason': reason,
        'type': type,
      };
}
