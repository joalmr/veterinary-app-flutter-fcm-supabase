import 'dart:convert';

List<VaccinesModel> vaccinesModelFromJson(String str) => List<VaccinesModel>.from(json.decode(str).map((x) => VaccinesModel.fromJson(x)));

String vaccinesModelToJson(List<VaccinesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VaccinesModel {
  int id;
  String name;

  VaccinesModel({
      this.id,
      this.name,
  });

  

  factory VaccinesModel.fromJson(Map<String, dynamic> json) => VaccinesModel(
      id: json["id"],
      name: json["name"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
  };
}
