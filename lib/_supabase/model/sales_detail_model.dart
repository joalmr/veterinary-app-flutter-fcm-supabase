// To parse this JSON data, do
//
//     final salesDetail = salesDetailFromJson(jsonString);

import 'dart:convert';

List<SalesDetailModel> salesDetailFromJson(String str) =>
    List<SalesDetailModel>.from(
        json.decode(str).map((x) => SalesDetailModel.fromJson(x)));

// String salesDetailToJson(List<SalesDetail> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalesDetailModel {
  SalesDetailModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.productSaleId,
    this.productTypeId,
  });

  String? id;
  String? name;
  double? price;
  int? quantity;
  String? productSaleId;
  int? productTypeId;

  factory SalesDetailModel.fromJson(Map<String, dynamic> json) =>
      SalesDetailModel(
        id: json['id'],
        name: json['name'],
        price: json['price'].toDouble(),
        quantity: json['quantity'],
        productSaleId: json['product_sale_id'],
        productTypeId: json['product_type_id'],
      );

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'price': price,
  //       'quantity': quantity,
  //       'product_sale_id': productSaleId,
  //       'product_type_id': productTypeId,
  //     };
}
