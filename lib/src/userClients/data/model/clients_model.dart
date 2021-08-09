// To parse this JSON data, do
//
//     final clientsModel = clientsModelFromJson(jsonString);

import 'dart:convert';

ClientsModel clientsModelFromJson(String str) =>
    ClientsModel.fromJson(json.decode(str));

String clientsModelToJson(ClientsModel data) => json.encode(data.toJson());

class ClientsModel {
  ClientsModel({
    this.message,
    this.result,
  });

  String? message;
  List<ResultClients>? result;

  factory ClientsModel.fromJson(Map<String, dynamic> json) => ClientsModel(
        message: json['message'],
        result: List<ResultClients>.from(
            json['result'].map((x) => ResultClients.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class ResultClients {
  ResultClients({
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

  factory ResultClients.fromJson(Map<String, dynamic> json) => ResultClients(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        phone: json['phone'],
        email: json['email'],
        settings: Settings.fromJson(json['settings']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'settings': settings!.toJson(),
      };
}

class Settings {
  Settings({
    this.address,
  });

  Address? address;

  factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        address: Address.fromJson(json['address']),
      );

  Map<String, dynamic> toJson() => {
        'address': address!.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
      };
}
