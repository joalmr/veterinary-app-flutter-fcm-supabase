// To parse this JSON data, do
//
//     final invitationModel = invitationModelFromJson(jsonString);

import 'dart:convert';

InvitationModel invitationModelFromJson(String str) => InvitationModel.fromJson(json.decode(str));

String invitationModelToJson(InvitationModel data) => json.encode(data.toJson());

class InvitationModel {
    InvitationModel({
        this.message,
        this.result,
    });

    String? message;
    bool? result;

    factory InvitationModel.fromJson(Map<String, dynamic> json) => InvitationModel(
        message: json["message"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "result": result,
    };
}
