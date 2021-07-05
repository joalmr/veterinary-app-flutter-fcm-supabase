// To parse this JSON data, do
//
//     final calendarBookingModel = calendarBookingModelFromJson(jsonString);

import 'dart:convert';

CalendarBookingModel calendarBookingModelFromJson(String str) =>
    CalendarBookingModel.fromJson(json.decode(str));

String calendarBookingModelToJson(CalendarBookingModel data) =>
    json.encode(data.toJson());

class CalendarBookingModel {
  CalendarBookingModel({
    this.message,
    this.result,
  });

  String? message;
  List<CalendarBooking>? result;

  factory CalendarBookingModel.fromJson(Map<String, dynamic> json) =>
      CalendarBookingModel(
        message: json['message'] as String?,
        result: List<CalendarBooking>.from(
            json['result'].map((x) => CalendarBooking.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': List<dynamic>.from(result?.map((x) => x.toJson()) ?? []),
      };
}

class CalendarBooking {
  CalendarBooking({
    this.petPicture,
    this.petBreed,
    this.petId,
    this.petName,
    this.date,
    this.userName,
    this.userId,
    this.bookingStatus,
    this.bookingId,
  });

  String? petPicture;
  String? petBreed;
  String? petId;
  String? petName;
  DateTime? date;
  String? userName;
  String? userId;
  String? bookingStatus;
  String? bookingId;

  factory CalendarBooking.fromJson(Map<String, dynamic> json) =>
      CalendarBooking(
        petPicture: json['pet_picture'] as String?,
        petBreed: json['pet_breed'] as String?,
        petId: json['pet_id'] as String?,
        petName: json['pet_name'] as String?,
        date: DateTime?.parse(json['date'] as String),
        userName: json['user_name'] as String?,
        userId: json['user_id'] as String?,
        bookingStatus: json['booking_status'] as String?,
        bookingId: json['booking_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'pet_picture': petPicture,
        'pet_breed': petBreed,
        'pet_id': petId,
        'pet_name': petName,
        'date':
            '''${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}''',
        'user_name': userName,
        'user_id': userId,
        'booking_status': bookingStatus,
        'booking_id': bookingId,
      };
}
