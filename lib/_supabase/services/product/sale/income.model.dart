// To parse this JSON data, do
//
//     final incomeModel = incomeModelFromJson(jsonString);

// import 'dart:convert';

// List<IncomeDataModel> incomeModelFromJson(String str) =>
//     List<IncomeDataModel>.from(
//         json.decode(str).map((x) => IncomeDataModel.fromJson(x)));

// String incomeModelToJson(List<IncomeDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncomeDataModel {
  IncomeDataModel({
    this.productTypeId,
    this.sum,
  });

  int? productTypeId;
  double? sum;

  factory IncomeDataModel.fromJson(Map<String, dynamic> json) =>
      IncomeDataModel(
        productTypeId: json['product_type_id'].toInt(),
        sum: json['sum'].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'product_type_id': productTypeId,
        'sum': sum,
      };
}
