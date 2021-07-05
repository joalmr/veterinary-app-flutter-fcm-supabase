class EstablishmentModel {
  EstablishmentModel({
    this.id,
    this.establishmentId,
    this.name,
  });

  int? id;
  String? establishmentId;
  String? name;

  factory EstablishmentModel.fromJson(Map<String, dynamic> json) =>
      EstablishmentModel(
        id: json['id'] as int?,
        establishmentId: json['establishment_id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'establishment_id': establishmentId,
        'name': name,
      };
}
