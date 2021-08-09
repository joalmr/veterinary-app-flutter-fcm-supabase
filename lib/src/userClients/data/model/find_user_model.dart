// To parse this JSON data, do
//
//     final findUserModel = findUserModelFromJson(jsonString);

import 'dart:convert';

FindUserModel findUserModelFromJson(String str) =>
    FindUserModel.fromJson(json.decode(str));

String findUserModelToJson(FindUserModel data) => json.encode(data.toJson());

class FindUserModel {
  FindUserModel({
    this.message,
    this.result,
  });

  String? message;
  ResultFindUser? result;

  factory FindUserModel.fromJson(Map<String, dynamic> json) => FindUserModel(
        message: json['message'],
        result: ResultFindUser.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': result!.toJson(),
      };
}

class ResultFindUser {
  ResultFindUser({
    this.id,
    this.name,
    this.lastname,
    this.phone,
    this.email,
    this.settings,
    this.pets,
  });

  String? id;
  String? name;
  String? lastname;
  String? phone;
  String? email;
  Settings? settings;
  List<PetClient>? pets;

  factory ResultFindUser.fromJson(Map<String, dynamic> json) => ResultFindUser(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        phone: json['phone'],
        email: json['email'],
        settings: Settings.fromJson(json['settings']),
        pets: List<PetClient>.from(
            json['pets'].map((x) => PetClient.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'phone': phone,
        'email': email,
        'settings': settings!.toJson(),
        'pets': List<dynamic>.from(pets!.map((x) => x.toJson())),
      };
}

class PetClient {
  PetClient({
    this.id,
    this.name,
    this.specieId,
    this.specieName,
    this.breedId,
    this.breedName,
    this.genre,
    this.weight,
    this.birthdate,
    this.picture,
    this.status,
  });

  String? id;
  String? name;
  int? specieId;
  String? specieName;
  int? breedId;
  String? breedName;
  int? genre;
  double? weight;
  DateTime? birthdate;
  String? picture;
  int? status;

  factory PetClient.fromJson(Map<String, dynamic> json) => PetClient(
        id: json['id'],
        name: json['name'],
        specieId: json['specie_id'],
        specieName: json['specie_name'],
        breedId: json['breed_id'],
        breedName: json['breed_name'],
        genre: json['genre'],
        weight: json['weight'].toDouble(),
        birthdate: DateTime.parse(json['birthdate']),
        picture: json['picture'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'specie_id': specieId,
        'specie_name': specieName,
        'breed_id': breedId,
        'breed_name': breedName,
        'genre': genre,
        'weight': weight,
        'birthdate': birthdate!.toIso8601String(),
        'picture': picture,
        'status': status,
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
