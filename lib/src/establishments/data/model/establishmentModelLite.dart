import 'dart:convert';

List<EstablecimientoModelLite> establecimientoModelLiteFromJson(String str) =>
    List<EstablecimientoModelLite>.from(
        json.decode(str).map((x) => EstablecimientoModelLite.fromJson(x)));

String establecimientoModelLiteToJson(List<EstablecimientoModelLite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EstablecimientoModelLite {
  EstablecimientoModelLite({
    this.id,
    this.name,
    this.stars,
    this.logo,
  });

  String id;
  String name;
  String stars;
  String logo;

  factory EstablecimientoModelLite.fromJson(Map<String, dynamic> json) =>
      EstablecimientoModelLite(
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
