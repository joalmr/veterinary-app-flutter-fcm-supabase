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
  Result result;

  factory WorkersModal.fromJson(Map<String, dynamic> json) => WorkersModal(
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.workers,
  });

  List<WorkerApp> workers;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        workers: List<WorkerApp>.from(
            json["workers"].map((x) => WorkerApp.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "workers": List<dynamic>.from(workers.map((x) => x.toJson())),
      };
}

class WorkerApp {
  WorkerApp({
    this.id,
    this.name,
    this.email,
    this.establishment,
  });

  String id;
  String name;
  String email;
  String establishment;

  factory WorkerApp.fromJson(Map<String, dynamic> json) => WorkerApp(
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
