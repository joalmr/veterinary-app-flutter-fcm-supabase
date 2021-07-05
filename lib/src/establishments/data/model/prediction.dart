import 'dart:convert';

Address addressFromJson(String str) => Address.fromJson(json.decode(str));

String addressToJson(Address data) => json.encode(data.toJson());

class Address {
  List<Prediction>? predictions;
  String? status;

  Address({
    this.predictions,
    this.status,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        predictions: List<Prediction>.from(
            json['predictions'].map((x) => Prediction.fromJson(x))),
        status: json['status'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'predictions': List<dynamic>.from(predictions!.map((x) => x.toJson())),
        'status': status,
      };
}

class Prediction {
  String? name;
  String? id;
  String? placeId;

  Prediction({
    this.name,
    this.id,
    this.placeId,
  });

  factory Prediction.fromJson(Map<String, dynamic> json) => Prediction(
        name: json['description'] as String?,
        id: json['id'] as String?,
        placeId: json['place_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'description': name,
        'id': id,
      };

  @override
  String toString() => name!;

  @override
  bool operator ==(Object o) => o is Prediction && o.id == id;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
