// import 'dart:convert';

// List<ReservaModel> reservaModelFromJson(String str) => List<ReservaModel>.from(
//     json.decode(str).map((x) => ReservaModel.fromJson(x)));

// String reservaModelToJson(List<ReservaModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class ReservaModel {
//   ReservaModel({
//     this.id,
//     this.bookingDate,
//     this.bookingTime,
//     this.bookingStatus,
//     this.petName,
//     this.petBreed,
//     this.petPicture,
//     this.user,
//   });

//   String id;
//   DateTime bookingDate;
//   String bookingTime;
//   String bookingStatus;
//   String petName;
//   String petBreed;
//   String petPicture;
//   String user;

//   factory ReservaModel.fromJson(Map<String, dynamic> json) => ReservaModel(
//         id: json["id"],
//         bookingDate: DateTime.parse(json["booking_date"]),
//         bookingTime: json["booking_time"],
//         bookingStatus: json["booking_status"],
//         petName: json["pet_name"],
//         petBreed: json["pet_breed"],
//         petPicture: json["pet_picture"],
//         user: json["user"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "booking_date":
//             "${bookingDate.year.toString().padLeft(4, '0')}-${bookingDate.month.toString().padLeft(2, '0')}-${bookingDate.day.toString().padLeft(2, '0')}",
//         "booking_time": bookingTime,
//         "booking_status": bookingStatus,
//         "pet_name": petName,
//         "pet_breed": petBreed,
//         "pet_picture": petPicture,
//         "user": user,
//       };
// }
