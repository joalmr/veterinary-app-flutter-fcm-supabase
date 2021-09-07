// To parse this JSON data, do
//
//     final sales = salesFromJson(jsonString);

import 'dart:convert';

import 'package:vet_app/_supabase/model/petlover_model.dart';

List<SalesModel> salesFromJson(String str) =>
    List<SalesModel>.from(json.decode(str).map((x) => SalesModel.fromJson(x)));

// String salesToJson(List<SalesModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalesModel {
  SalesModel({
    this.id,
    this.registeredAt,
    this.price,
    this.establishmentId,
    this.petloverId,
    this.petlover,
  });

  String? id;
  DateTime? registeredAt;
  double? price;
  int? establishmentId;
  int? petloverId;
  PetloverModel? petlover;

  factory SalesModel.fromJson(Map<String, dynamic> json) => SalesModel(
        id: json['id'],
        registeredAt: DateTime.parse(json['registered_at']),
        price: json['price'].toDouble(),
        establishmentId: json['establishment_id'],
        petloverId: json['petlover_id'],
        petlover: PetloverModel.fromJson(json['petlover']),
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'registered_at': registeredAt!.toIso8601String(),
  //       'price': price,
  //       'establishment_id': establishmentId,
  //       'petlover_id': petloverId,
  //       'petlover': petlover!.toJson(),
  //     };
}
