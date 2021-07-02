class EstablecimientoEntity {
  String? name;
  String? phone;
  String? ruc;
  String? website;
  int? typeId;
  String? address;
  String? reference;
  double? latitude;
  double? longitude;
  List<int>? services;

  EstablecimientoEntity({
    this.name,
    this.phone,
    this.ruc,
    this.website,
    this.typeId,
    this.address,
    this.reference,
    this.latitude,
    this.longitude,
    this.services,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "ruc": ruc,
        "website": website,
        "type_id": typeId,
        "address": address,
        "reference": reference,
        "latitude": latitude,
        "longitude": longitude,
        "services": services,
      };
}
