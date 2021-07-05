// To parse this JSON data, do
//
//     final bookingModel = bookingModelFromJson(jsonString);

import 'dart:convert';

BookingModel bookingModelFromJson(String str) =>
    BookingModel.fromJson(json.decode(str) as Map<String, dynamic>);

String bookingModelToJson(BookingModel data) => json.encode(data.toJson());

class BookingModel {
  List<Booking>? result;
  String? message;

  BookingModel({
    this.result,
    this.message,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
        result: List<Booking>.from(json['result']
                .map((x) => Booking.fromJson(x as Map<String, dynamic>))
            as Iterable<dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'result': List<dynamic>.from(result?.map((x) => x.toJson()) ?? []),
        'message': message,
      };
}

class Booking {
  String? id;
  DateTime? bookingDate;
  String? bookingTime;
  List<String>? bookingServices;
  String? bookingStatus;
  String? petName;
  String? petBreed;
  String? petPicture;
  String? user;
  String? userPhone;
  Options? options;
  String? observation;

  Booking({
    this.id,
    this.bookingDate,
    this.bookingTime,
    this.bookingServices,
    this.bookingStatus,
    this.petName,
    this.petBreed,
    this.petPicture,
    this.user,
    this.userPhone,
    this.options,
    this.observation,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json['id'] as String?,
        bookingDate: DateTime?.parse(json['booking_date'] as String),
        bookingTime: json['booking_time'] as String?,
        bookingServices:
            List<String>.from(json['booking_services'].map((x) => x)),
        bookingStatus: json['booking_status'] as String?,
        petName: json['pet_name'] as String?,
        petBreed: json['pet_breed'] as String?,
        petPicture: json['pet_picture'] as String?,
        user: json['user'] as String?,
        userPhone: json['user_phone'] as String?,
        options: Options?.fromJson(json['options'] as Map<String, dynamic>),
        observation: json['observation'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'booking_date': bookingDate == null
            ? null
            : '''${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}''',
        'booking_time': bookingTime,
        'booking_services':
            List<dynamic>.from(bookingServices?.map((x) => x) ?? []),
        'booking_status': bookingStatus,
        'pet_name': petName,
        'pet_breed': petBreed,
        'pet_picture': petPicture,
        'user': user,
        'user_phone': userPhone,
        'options': options!.toJson(),
        'observation': observation,
      };
}

class Options {
  String? address;
  String? delivery;
  String? typeId;

  Options({
    this.address,
    this.delivery,
    this.typeId,
  });

  factory Options.fromJson(Map<String, dynamic> json) => Options(
        address: json['address'] as String? ?? '',
        delivery: json['delivery'] as String? ?? '',
        typeId: json['type_id'] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        'address': address,
        'delivery': delivery,
        'type_id': typeId,
      };
}
