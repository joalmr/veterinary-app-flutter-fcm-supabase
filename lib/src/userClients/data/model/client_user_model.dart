// To parse this JSON data, do
//
//     final userClientModel = userClientModelFromJson(jsonString);

import 'dart:convert';

import 'find_user_model.dart';

UserClientModel userClientModelFromJson(String str) =>
    UserClientModel.fromJson(json.decode(str));

String userClientModelToJson(UserClientModel data) =>
    json.encode(data.toJson());

class UserClientModel {
  UserClientModel({
    this.message,
    this.result,
  });

  String? message;
  ResultUserClient? result;

  factory UserClientModel.fromJson(Map<String, dynamic> json) =>
      UserClientModel(
        message: json['message'],
        result: ResultUserClient.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': result!.toJson(),
      };
}

class ResultUserClient {
  ResultUserClient({
    this.amount,
    this.attentions,
    this.user,
  });

  double? amount;
  int? attentions;
  User? user;

  factory ResultUserClient.fromJson(Map<String, dynamic> json) =>
      ResultUserClient(
        amount: json['amount'].toDouble(),
        attentions: json['attentions'],
        user: User.fromJson(json['user']),
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'attentions': attentions,
        'user': user!.toJson(),
      };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
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
