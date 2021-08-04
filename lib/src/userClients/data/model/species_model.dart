// To parse this JSON data, do
//
//     final speciesModel = speciesModelFromJson(jsonString);

import 'dart:convert';

SpeciesModel speciesModelFromJson(String str) =>
    SpeciesModel.fromJson(json.decode(str));

String speciesModelToJson(SpeciesModel data) => json.encode(data.toJson());

class SpeciesModel {
  SpeciesModel({
    this.species,
  });

  List<Species>? species;

  factory SpeciesModel.fromJson(Map<String, dynamic> json) => SpeciesModel(
        species:
            List<Species>.from(json['species'].map((x) => Species.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'species': List<dynamic>.from(species!.map((x) => x.toJson())),
      };
}

class Species {
  Species({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        id: json['id'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
