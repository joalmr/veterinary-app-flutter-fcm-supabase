import 'dart:convert';

List<EstablecimientoModelLite> establecimientoModelLiteFromJson(String str) =>
    List<EstablecimientoModelLite>.from(
        json.decode(str).map((x) => EstablecimientoModelLite.fromJson(x)));

String establecimientoModelLiteToJson(List<EstablecimientoModelLite> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EstablecimientoModelLite {
  String? id;
  String? logo;
  String? name;
  String? ruc;
  int? type;
  int? status;

  EstablecimientoModelLite({
    this.id,
    this.logo,
    this.name,
    this.ruc,
    this.type,
    this.status,
  });

  factory EstablecimientoModelLite.fromJson(Map<String, dynamic> json) =>
      EstablecimientoModelLite(
        id: json['id'],
        logo: json['logo'],
        name: json['name'],
        ruc: json['ruc'],
        type: json['type'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo': logo,
        'name': name,
        'ruc': ruc,
        'type': type,
        'status': status,
      };
}
