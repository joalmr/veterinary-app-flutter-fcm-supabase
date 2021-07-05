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

  String? message;
  Result? result;

  factory WorkersModalInvitado.fromJson(Map<String, dynamic> json) =>
      WorkersModalInvitado(
        message: json['message'],
        result: Result.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'result': result!.toJson(),
      };
}

class Result {
  Result({
    this.invitations,
  });

  List<Invitation>? invitations;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        invitations: List<Invitation>.from(
            json['invitations'].map((x) => Invitation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'invitations': List<dynamic>.from(invitations!.map((x) => x.toJson())),
      };
}

class Invitation {
  Invitation({
    this.id,
    this.establishmentId,
    this.establishmentName,
    this.email,
    this.createdAt,
  });

  String? id;
  String? establishmentId;
  String? establishmentName;
  String? email;
  DateTime? createdAt;

  factory Invitation.fromJson(Map<String, dynamic> json) => Invitation(
        id: json['id'],
        establishmentId: json['establishment_id'],
        establishmentName: json['establishment_name'],
        email: json['email'],
        createdAt: DateTime.parse(json['created_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'establishment_id': establishmentId,
        'establishment_name': establishmentName,
        'email': email,
        'created_at': createdAt!.toIso8601String(),
      };
}
