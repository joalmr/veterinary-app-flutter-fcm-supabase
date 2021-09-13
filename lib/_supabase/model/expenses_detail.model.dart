// To parse this JSON data, do
//
//     final expensesDetailModel = expensesDetailModelFromJson(jsonString);

import 'dart:convert';

List<ExpensesDetailModel> expensesDetailModelFromJson(String str) =>
    List<ExpensesDetailModel>.from(
        json.decode(str).map((x) => ExpensesDetailModel.fromJson(x)));

String expensesDetailModelToJson(List<ExpensesDetailModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpensesDetailModel {
  ExpensesDetailModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.productName,
    this.price,
    this.quantity,
    this.productExpenseId,
    this.productTypeId,
    this.supplierName,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? productName;
  double? price;
  int? quantity;
  String? productExpenseId;
  int? productTypeId;
  String? supplierName;

  factory ExpensesDetailModel.fromJson(Map<String, dynamic> json) =>
      ExpensesDetailModel(
        id: json['id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        productName: json['product_name'],
        price: json['price'].toDouble(),
        quantity: json['quantity'],
        productExpenseId: json['product_expense_id'],
        productTypeId: json['product_type_id'],
        supplierName: json['supplier_name'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt!.toIso8601String(),
        'updated_at': updatedAt!.toIso8601String(),
        'product_name': productName,
        'price': price,
        'quantity': quantity,
        'product_expense_id': productExpenseId,
        'product_type_id': productTypeId,
        'supplier_name': supplierName,
      };
}
