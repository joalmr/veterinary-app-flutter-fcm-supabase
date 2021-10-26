// To parse this JSON data, do
//
//     final petloverUser = petloverUserFromJson(jsonString);

import 'dart:convert';

PetloverUser petloverUserFromJson(String str) =>
    PetloverUser.fromJson(json.decode(str));

class PetloverUser {
  PetloverUser({
    this.message,
    this.result,
  });

  String? message;
  Result? result;

  factory PetloverUser.fromJson(Map<String, dynamic> json) => PetloverUser(
        message: json['message'],
        result: Result.fromJson(json['result']),
      );
}

class Result {
  Result({
    this.id,
    this.name,
    this.lastname,
    this.phone,
    this.email,
    this.settings,
  });

  String? id;
  String? name;
  String? lastname;
  String? phone;
  String? email;
  Settings? settings;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        phone: json['phone'],
        email: json['email'],
        settings: Settings.fromJson(json['settings']),
      );
}

class Settings {
  Settings({
    this.address,
  });

  Address? address;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        address: Address.fromJson(json['address']),
      );
}

class Address {
  Address({
    this.address,
    this.latitude,
    this.longitude,
  });

  String? address;
  String? latitude;
  String? longitude;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address: json['address'],
        latitude: json['latitude'],
        longitude: json['longitude'],
      );
}
