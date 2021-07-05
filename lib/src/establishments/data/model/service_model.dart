import 'dart:convert';

List<ServiceVetModel> serviceVetModelFromJson(String str) =>
    List<ServiceVetModel>.from(
        json.decode(str).map((x) => ServiceVetModel.fromJson(x)));

String serviceVetModelToJson(List<ServiceVetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceVetModel {
  int? id;
  String? name;

  ServiceVetModel({
    this.id,
    this.name,
  });

  factory ServiceVetModel.fromJson(Map<String, dynamic> json) =>
      ServiceVetModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
