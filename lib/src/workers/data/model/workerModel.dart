// To parse this JSON data, do
//
//     final workersModal = workersModalFromJson(jsonString);

import 'dart:convert';

WorkersModal workersModalFromJson(String str) =>
    WorkersModal.fromJson(json.decode(str));

String workersModalToJson(WorkersModal data) => json.encode(data.toJson());

class WorkersModal {
  WorkersModal({
    this.message,
    this.result,
  });

  String message;
  List<Trabajador> result;

  factory WorkersModal.fromJson(Map<String, dynamic> json) => WorkersModal(
        message: json["message"],
        result: List<Trabajador>.from(
            json["result"].map((x) => Trabajador.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Trabajador {
  Trabajador({
    this.id,
    this.name,
    this.email,
    this.establishment,
  });

  String id;
  String name;
  String email;
  String establishment;

  factory Trabajador.fromJson(Map<String, dynamic> json) => Trabajador(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        establishment: json["establishment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "establishment": establishment,
      };
}
