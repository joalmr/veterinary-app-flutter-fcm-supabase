import 'dart:convert';

VetStorage vetStorageFromJson(String str) =>
    VetStorage.fromJson(json.decode(str) as Map<String, dynamic>);

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
        vetId: json['vetId'] as String,
        vetName: json['vetName'] as String,
        vetLogo: json['vetLogo'] as String,
      );

  Map<String, dynamic> toJson() => {
        'vetId': vetId,
        'vetName': vetName,
        'vetLogo': vetLogo,
      };
}
