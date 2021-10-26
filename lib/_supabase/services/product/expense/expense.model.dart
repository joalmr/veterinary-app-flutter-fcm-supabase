// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

// import 'dart:convert';

// List<ExpenseDataModel> expenseModelFromJson(String str) => List<ExpenseDataModel>.from(
//     json.decode(str).map((x) => ExpenseDataModel.fromJson(x)));

// String expenseModelToJson(List<ExpenseDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpenseDataModel {
  ExpenseDataModel({
    this.productTypeId,
    this.sum,
  });

  int? productTypeId;
  double? sum;

  factory ExpenseDataModel.fromJson(Map<String, dynamic> json) =>
      ExpenseDataModel(
        productTypeId: json['product_type_id'].toInt(),
        sum: json['sum'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'product_type_id': productTypeId,
        'sum': sum,
      };
}
