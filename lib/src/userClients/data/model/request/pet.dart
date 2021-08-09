// To parse this JSON data, do
//
//     final userClientModel = userClientModelFromJson(jsonString);

import 'dart:convert';

import 'package:vet_app/resources/utils/datetime_format.dart';

PetModelReq petModelFromJson(String str) =>
    PetModelReq.fromJson(json.decode(str));

String petModelToJson(PetModelReq data) => json.encode(data.toJson());

class PetModelReq {
  PetModelReq({
    this.birthdate,
    this.breed,
    this.name,
    this.genre,
    this.specie,
    this.userId,
  });

  DateTime? birthdate;
  int? breed;
  String? name;
  int? genre;
  int? specie;
  String? userId;

  factory PetModelReq.fromJson(Map<String, dynamic> json) => PetModelReq(
        birthdate: DateTime.parse(json['birthdate']),
        breed: json['breed'],
        name: json['name'],
        genre: json['genre'],
        specie: json['specie'],
        userId: json['user_id'],
      );

  Map<String, dynamic> toJson() => {
        'birthdate': formatYMDHms(birthdate!), //birthdate!.toIso8601String(),
        'breed': breed,
        'name': name,
        'genre': genre,
        'specie': specie,
        'user_id': userId,
      };
}
