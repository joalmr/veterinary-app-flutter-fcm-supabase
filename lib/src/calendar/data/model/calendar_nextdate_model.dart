// To parse this JSON data, do
//
//     final calendarNextdateModel = calendarNextdateModelFromJson(jsonString);

import 'dart:convert';

CalendarNextdateModel calendarNextdateModelFromJson(String str) =>
    CalendarNextdateModel.fromJson(json.decode(str));

String calendarNextdateModelToJson(CalendarNextdateModel data) =>
    json.encode(data.toJson());

class CalendarNextdateModel {
  CalendarNextdateModel({
    this.message,
    this.result,
  });

  String? message;
  List<CalendarNextdate>? result;

  factory CalendarNextdateModel.fromJson(Map<String, dynamic> json) =>
      CalendarNextdateModel(
        message: json['message'] as String?,
        result: List<CalendarNextdate>.from(
            json['result'].map((x) => CalendarNextdate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': List<dynamic>.from(result?.map((x) => x.toJson()) ?? []),
      };
}

class CalendarNextdate {
  CalendarNextdate({
    this.petPicture,
    this.petBreed,
    this.petName,
    this.userName,
    // this.userPhone,
    this.nextdate,
    this.reason,
    this.type,
  });

  String? petPicture;
  String? petBreed;
  String? petName;
  String? userName;
  // String userPhone;
  DateTime? nextdate;
  String? reason;
  String? type;

  factory CalendarNextdate.fromJson(Map<String, dynamic> json) =>
      CalendarNextdate(
        petPicture: json['pet_picture'] as String?,
        petBreed: json['pet_breed'] as String?,
        petName: json['pet_name'] as String?,
        userName: json['user_name'] as String?,
        // userPhone: json['user_phone'],
        nextdate: DateTime?.parse(json['nextdate'] as String),
        reason: json['reason'] as String?,
        type: json['type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pet_picture': petPicture,
        'pet_breed': petBreed,
        'pet_name': petName,
        'user_name': userName,
        // 'user_phone': userPhone,
        'nextdate':
            '''${nextdate!.year.toString().padLeft(4, '0')}-${nextdate!.month.toString().padLeft(2, '0')}-${nextdate!.day.toString().padLeft(2, '0')}''',
        'reason': reason,
        'type': type,
      };
}
