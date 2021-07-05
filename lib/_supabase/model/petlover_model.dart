class PetloverModel {
  PetloverModel({
    this.id,
    this.userId,
    this.name,
  });

  int? id;
  String? userId;
  String? name;

  factory PetloverModel.fromJson(Map<String, dynamic> json) => PetloverModel(
        id: json['id'] as int?,
        userId: json['user_id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'name': name,
      };
}
