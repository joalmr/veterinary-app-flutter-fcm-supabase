// To parse this JSON data, do
//
//     final sales = salesFromJson(jsonString);

import 'dart:convert';

List<Sales> salesFromJson(String str) =>
    List<Sales>.from(json.decode(str).map((x) => Sales.fromJson(x)));

String salesToJson(List<Sales> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sales {
  Sales({
    this.id,
    this.registeredAt,
    this.price,
    this.establishmentId,
    this.petloverId,
  });

  String? id;
  DateTime? registeredAt;
  double? price;
  int? establishmentId;
  int? petloverId;

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        id: json['id'],
        registeredAt: DateTime.parse(json['registered_at']),
        price: json['price']?.toDouble() ?? 0,
        establishmentId: json['establishment_id'],
        petloverId: json['petlover_id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'registered_at': registeredAt!.toIso8601String(),
        'price': price,
        'establishment_id': establishmentId,
        'petlover_id': petloverId,
      };
}
