// import 'package:get/get.dart';

// class RxEstablecimientoEntity {
//   RxString name;
//   RxString phone;
//   RxString ruc;
//   RxString website;
//   RxInt typeId;
//   RxString address;
//   RxString reference;
//   RxDouble latitude;
//   RxDouble longitude;
//   RxList<int> services;

//   RxEstablecimientoEntity(
//     this.name,
//     this.phone,
//     this.ruc,
//     this.website,
//     this.typeId,
//     this.address,
//     this.reference,
//     this.latitude,
//     this.longitude,
//     this.services,
//   );
// }

class EstablecimientoEntity {
  String name;
  String phone;
  String ruc;
  String website;
  int typeId;
  String address;
  String reference;
  double latitude;
  double longitude;
  List<int> services;

  // RxEstablecimientoEntity rx;
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
  //  {
  //   rx = RxEstablecimientoEntity(
  //     name.obs,
  //     phone.obs,
  //     ruc.obs,
  //     website.obs,
  //     typeId.obs,
  //     address.obs,
  //     reference.obs,
  //     latitude.obs,
  //     longitude.obs,
  //     services.obs,
  //   );
  // }

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
