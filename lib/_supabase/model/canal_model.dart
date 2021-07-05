import 'petlover_model.dart';

class CanalModel {
  CanalModel({
    this.id,
    this.petloverId,
    this.establishmentId,
    this.petlover,
  });

  int? id;
  int? establishmentId;
  int? petloverId;
  PetloverModel? petlover;

  // String userId;
  // String petloverName;

  factory CanalModel.fromJson(Map<String, dynamic> json) => CanalModel(
        id: json['id'],
        petloverId: json['petlover_id'],
        establishmentId: json['establishment_id'],
        petlover: json['petlover'] == null
            ? null
            : PetloverModel.fromJson(json['petlover'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'petlover_id': petloverId,
        'establishment_id': establishmentId,
        'petlover': petlover!.toJson(),
      };
}
