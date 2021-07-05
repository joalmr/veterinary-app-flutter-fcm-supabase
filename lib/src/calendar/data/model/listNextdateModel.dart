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
        message: json['message'],
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
        petPicture: json['pet_picture'],
        petBreed: json['pet_breed'],
        petName: json['pet_name'],
        userName: json['user_name'],
        userPhone: json['user_phone'],
        nextdate: DateTime.parse(json['nextdate']),
        reason: json['reason'],
        type: json['type'],
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
