// To parse this JSON data, do
//
//     final petClient = petClientFromJson(jsonString);

import 'dart:convert';

PetClient petClientFromJson(String str) => PetClient.fromJson(json.decode(str));

String petClientToJson(PetClient data) => json.encode(data.toJson());

class PetClient {
  PetClient({
    this.message,
    this.result,
  });

  String? message;
  Result? result;

  factory PetClient.fromJson(Map<String, dynamic> json) => PetClient(
        message: json['message'],
        result: json['result'] == null ? null : Result.fromJson(json['result']),
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'],
        name: json['name'],
        specieId: json['specie_id'],
        specieName: json['specie_name'],
        breedId: json['breed_id'],
        breedName: json['breed_name'],
        genre: json['genre'],
        weight: json['weight']?.toDouble() ?? 0,
        birthdate: DateTime?.parse(json['birthdate']),
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
