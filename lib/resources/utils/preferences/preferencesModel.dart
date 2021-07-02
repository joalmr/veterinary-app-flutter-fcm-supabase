import 'dart:convert';

VetStorage vetStorageFromJson(String str) =>
    VetStorage.fromJson(json.decode(str));

String vetStorageToJson(VetStorage data) => json.encode(data.toJson());

class VetStorage {
  VetStorage({
    this.vetId,
    this.vetName,
    this.vetLogo,
  });

  String? vetId;
  String? vetName;
  String? vetLogo;

  factory VetStorage.fromJson(Map<String, dynamic> json) => VetStorage(
        vetId: json["vetId"],
        vetName: json["vetName"],
        vetLogo: json["vetLogo"],
      );

  Map<String, dynamic> toJson() => {
        "vetId": vetId,
        "vetName": vetName,
        "vetLogo": vetLogo,
      };
}
