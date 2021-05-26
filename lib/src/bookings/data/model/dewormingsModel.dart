import 'dart:convert';

List<DewormingsModel> dewormingsModelFromJson(String str) => List<DewormingsModel>.from(json.decode(str).map((x) => DewormingsModel.fromJson(x)));

String dewormingsModelToJson(List<DewormingsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DewormingsModel {
  int id;
  String name;

  DewormingsModel({
      this.id,
      this.name,
  });

  

  factory DewormingsModel.fromJson(Map<String, dynamic> json) => DewormingsModel(
      id: json["id"],
      name: json["name"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
  };
}
