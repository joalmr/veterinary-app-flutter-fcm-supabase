import 'dart:convert';

CalendarEventResponse calendarEventResponseFromJson(String str) =>
    CalendarEventResponse.fromJson(json.decode(str));

String calendarEventResponseToJson(CalendarEventResponse data) =>
    json.encode(data.toJson());

class CalendarEventResponse {
  CalendarEventResponse({
    this.message,
    this.result,
  });

  String? message;
  bool? result;

  factory CalendarEventResponse.fromJson(Map<String, dynamic> json) =>
      CalendarEventResponse(
        message: json['message'],
        result: json['result'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': result,
      };
}
