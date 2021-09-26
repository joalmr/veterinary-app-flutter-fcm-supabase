// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

import 'dart:convert';

List<ExpenseModel> expenseModelFromJson(String str) => List<ExpenseModel>.from(
    json.decode(str).map((x) => ExpenseModel.fromJson(x)));

String expenseModelToJson(List<ExpenseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpenseModel {
  ExpenseModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.price,
    this.establishmentId,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? price;
  int? establishmentId;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        price: json['price'].toDouble(),
        establishmentId: json['establishment_id'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt!.toIso8601String(),
        'updated_at': updatedAt!.toIso8601String(),
        'price': price,
        'establishment_id': establishmentId,
      };
}
