// To parse this JSON data, do
//
//     final workersModal = workersModalFromJson(jsonString);

import 'dart:convert';

List<WorkersModalInvitado> workersModalInvitadoFromJson(String str) =>
    List<WorkersModalInvitado>.from(
        json.decode(str).map((x) => WorkersModalInvitado.fromJson(x)));

String workersModalInvitadoToJson(List<WorkersModalInvitado> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkersModalInvitado {
  WorkersModalInvitado({
    this.id,
    this.createdAt,
    this.email,
    this.establishment,
  });

  String id;
  String createdAt;
  String email;
  String establishment;

  factory WorkersModalInvitado.fromJson(Map<String, dynamic> json) =>
      WorkersModalInvitado(
        id: json["id"],
        createdAt: json["created_at"],
        email: json["email"],
        establishment: json["establishment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "email": email,
        "establishment": establishment,
      };
}
