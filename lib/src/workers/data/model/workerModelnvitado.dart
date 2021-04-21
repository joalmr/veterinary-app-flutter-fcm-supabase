// To parse this JSON data, do
//
//     final workersModalInvitado = workersModalInvitadoFromJson(jsonString);

import 'dart:convert';

WorkersModalInvitado workersModalInvitadoFromJson(String str) =>
    WorkersModalInvitado.fromJson(json.decode(str));

String workersModalInvitadoToJson(WorkersModalInvitado data) =>
    json.encode(data.toJson());

class WorkersModalInvitado {
  WorkersModalInvitado({
    this.message,
    this.result,
  });

  String message;
  List<WorkerInvitation> result;

  factory WorkersModalInvitado.fromJson(Map<String, dynamic> json) =>
      WorkersModalInvitado(
        message: json["message"],
        result: List<WorkerInvitation>.from(
            json["result"].map((x) => WorkerInvitation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class WorkerInvitation {
  WorkerInvitation({
    this.id,
    this.establishmentId,
    this.userId,
    this.email,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String establishmentId;
  String userId;
  String email;
  String token;
  DateTime createdAt;
  DateTime updatedAt;

  factory WorkerInvitation.fromJson(Map<String, dynamic> json) =>
      WorkerInvitation(
        id: json["id"],
        establishmentId: json["establishment_id"],
        userId: json["user_id"],
        email: json["email"],
        token: json["token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "establishment_id": establishmentId,
        "user_id": userId,
        "email": email,
        "token": token,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
