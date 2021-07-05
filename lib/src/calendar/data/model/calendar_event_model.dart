// To parse this JSON data, do
//
//     final calendarEventModel = calendarEventModelFromJson(jsonString);

import 'dart:convert';

CalendarEventModel calendarEventModelFromJson(String str) =>
    CalendarEventModel.fromJson(json.decode(str));

String calendarEventModelToJson(CalendarEventModel data) =>
    json.encode(data.toJson());

class CalendarEventModel {
  CalendarEventModel({
    this.message,
    this.result,
  });

  String? message;
  List<CalendarEvent>? result;

  factory CalendarEventModel.fromJson(Map<String, dynamic> json) =>
      CalendarEventModel(
        message: json['message'] as String?,
        result: List<CalendarEvent>.from(
            json['result'].map((x) => CalendarEvent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': List<dynamic>.from(result?.map((x) => x.toJson()) ?? []),
      };
}

class CalendarEvent {
  CalendarEvent({
    this.date,
    this.description,
    this.members,
    this.time,
    this.title,
  });

  String? date;
  String? description;
  String? members;
  String? time;
  String? title;

  factory CalendarEvent.fromJson(Map<String, dynamic> json) => CalendarEvent(
        date: json['date'] as String?,
        description: json['description'] as String?,
        members: json['members'] as String?,
        time: json['time'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'date': date,
        'description': description,
        'members': members,
        'time': time,
        'title': title,
      };
}
