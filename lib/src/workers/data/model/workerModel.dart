// To parse this JSON data, do
//
//     final workersModal = workersModalFromJson(jsonString);

import 'dart:convert';

List<WorkersModal> workersModalFromJson(String str) => List<WorkersModal>.from(json.decode(str).map((x) => WorkersModal.fromJson(x)));

String workersModalToJson(List<WorkersModal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkersModal {
    WorkersModal({
        this.id,
        this.name,
        this.email,
        this.establishment,
    });

    String id;
    String name;
    String email;
    String establishment;

    factory WorkersModal.fromJson(Map<String, dynamic> json) => WorkersModal(
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
