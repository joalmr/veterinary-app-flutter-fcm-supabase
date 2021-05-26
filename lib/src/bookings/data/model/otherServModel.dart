import 'dart:convert';

List<OtherServModel> otherServModelFromJson(String str) => List<OtherServModel>.from(json.decode(str).map((x) => OtherServModel.fromJson(x)));

String otherServModelToJson(List<OtherServModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OtherServModel {
  int id;
  String name;

  OtherServModel({
      this.id,
      this.name,
  });

  

  factory OtherServModel.fromJson(Map<String, dynamic> json) => OtherServModel(
      id: json["id"],
      name: json["name"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
  };
}
