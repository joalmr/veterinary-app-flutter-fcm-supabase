// To parse this JSON data, do
//
//     final listBookingsModel = listBookingsModelFromJson(jsonString);

import 'dart:convert';

ListBookingsModel listBookingsModelFromJson(String str) => ListBookingsModel.fromJson(json.decode(str));

String listBookingsModelToJson(ListBookingsModel data) => json.encode(data.toJson());

class ListBookingsModel {
  String message;
  Map<String, List<Result>> result;

  ListBookingsModel({
    this.message,
    this.result,
  });

  factory ListBookingsModel.fromJson(Map<String, dynamic> json) => ListBookingsModel(
    message: json["message"],
    result: Map.from(json["result"]).map((k, v) => MapEntry<String, List<Result>>(k, List<Result>.from(v.map((x) => Result.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": Map.from(result).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
  };
}

class Result {
  Result({
    this.bookingStatus,
    this.bookingId,
    this.date,
    this.petPicture,
    this.petBreed,
    this.petId,
    this.petName,
    this.time,
    this.userName,
    this.userId,
  });

  String bookingStatus;
  String bookingId;
  DateTime date;
  String petPicture;
  String petBreed;
  String petId;
  String petName;
  String time;
  String userName;
  String userId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    bookingStatus: json["booking_status"],
    bookingId: json["booking_id"],
    date: DateTime.parse(json["date"]),
    petPicture: json["pet_picture"],
    petBreed: json["pet_breed"],
    petId: json["pet_id"],
    petName: json["pet_name"],
    time: json["time"],
    userName: json["user_name"],
    userId: json["user_id"],
  );

  Map<String, dynamic> toJson() => {
    "booking_status": bookingStatus,
    "booking_id": bookingId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "pet_picture": petPicture,
    "pet_breed": petBreed,
    "pet_id": petId,
    "pet_name": petName,
    "time": time,
    "user_name": userName,
    "user_id": userId,
  };
}
