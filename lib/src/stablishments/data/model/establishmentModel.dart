import 'dart:convert';

List<EstablecimientoModel> establecimientoModelFromJson(String str) =>
    List<EstablecimientoModel>.from(
        json.decode(str).map((x) => EstablecimientoModel.fromJson(x)));

String establecimientoModelToJson(List<EstablecimientoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EstablecimientoModel {
  EstablecimientoModel({
    this.id,
    this.name,
    this.stars,
    this.logo,
  });

  String id;
  String name;
  String stars;
  String logo;

  factory EstablecimientoModel.fromJson(Map<String, dynamic> json) =>
      EstablecimientoModel(
        id: json["id"],
        name: json["name"],
        stars: json["stars"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "stars": stars,
        "logo": logo,
      };
}
