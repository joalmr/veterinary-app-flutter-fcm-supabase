// To parse this JSON data, do
//
//     final createPetlover = createPetloverFromJson(jsonString);

import 'dart:convert';

CreatePetlover createPetloverFromJson(String str) => CreatePetlover.fromJson(json.decode(str));

String createPetloverToJson(CreatePetlover data) => json.encode(data.toJson());

class CreatePetlover {
    CreatePetlover({
        this.message,
        this.result,
    });

    String? message;
    Result? result;

    factory CreatePetlover.fromJson(Map<String, dynamic> json) => CreatePetlover(
        message: json['message'],
        result: Result.fromJson(json['result']),
    );

    Map<String, dynamic> toJson() => {
        'message': message,
        'result': result!.toJson(),
    };
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
        this.createdByEstablishmentId,
        this.createdByUserId,
    });

    String? createdByEstablishmentId;
    String? createdByUserId;

    factory Settings.fromJson(Map<String, dynamic> json) => Settings(
        createdByEstablishmentId: json['created_by_establishment_id'],
        createdByUserId: json['created_by_user_id'],
    );

    Map<String, dynamic> toJson() => {
        'created_by_establishment_id': createdByEstablishmentId,
        'created_by_user_id': createdByUserId,
    };
}
