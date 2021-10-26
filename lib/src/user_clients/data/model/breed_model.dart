// To parse this JSON data, do
//
//     final breedModel = breedModelFromJson(jsonString);

import 'dart:convert';

BreedsModel breedsModelFromJson(String str) =>
    BreedsModel.fromJson(json.decode(str));

String breedsModelToJson(BreedsModel data) => json.encode(data.toJson());

class BreedsModel {
  BreedsModel({
    this.breeds,
  });

  List<Breed>? breeds;

  factory BreedsModel.fromJson(Map<String, dynamic> json) => BreedsModel(
        breeds: List<Breed>.from(json['breeds'].map((x) => Breed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'breeds': List<dynamic>.from(breeds!.map((x) => x.toJson())),
      };
}

class Breed {
  Breed({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Breed.fromJson(Map<String, dynamic> json) => Breed(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
