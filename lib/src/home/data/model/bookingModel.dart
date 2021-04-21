// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str));

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  BookingModel({
    this.response,
    this.message,
  });

  List<ResultBooking> response;
  String message;

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        response: List<ResultBooking>.from(
            json["response"].map((x) => ResultBooking.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
        "message": message,
      };
}

class ResultBooking {
  ResultBooking({
    this.id,
    this.bookingDate,
    this.bookingTime,
    this.bookingType,
    this.bookingStatus,
    this.petName,
    this.petBreed,
    this.petPicture,
    this.user,
    this.options,
    this.observation,
  });

  String id;
  DateTime bookingDate;
  String bookingTime;
  String bookingType;
  String bookingStatus;
  String petName;
  String petBreed;
  String petPicture;
  String user;
  Options options;
  dynamic observation;

  factory ResultBooking.fromJson(Map<String, dynamic> json) => ResultBooking(
        id: json["id"],
        bookingDate: DateTime.parse(json["booking_date"]),
        bookingTime: json["booking_time"],
        bookingType: json["booking_type"],
        bookingStatus: json["booking_status"],
        petName: json["pet_name"],
        petBreed: json["pet_breed"],
        petPicture: json["pet_picture"],
        user: json["user"],
        options: Options.fromJson(json["options"]),
        observation: json["observation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "booking_date":
            "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
        "booking_time": bookingTime,
        "booking_type": bookingType,
        "booking_status": bookingStatus,
        "pet_name": petName,
        "pet_breed": petBreed,
        "pet_picture": petPicture,
        "user": user,
        "options": options.toJson(),
        "observation": observation,
      };
}

class Options {
  Options({
    this.address,
    this.delivery,
    this.typeId,
  });

  dynamic address;
  dynamic delivery;
  String typeId;

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        address: json["address"],
        delivery: json["delivery"],
        typeId: json["type_id"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "delivery": delivery,
        "type_id": typeId,
      };
}
