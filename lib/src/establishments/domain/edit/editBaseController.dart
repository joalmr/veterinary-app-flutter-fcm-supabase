import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/data/model/prediction.dart';
import 'package:vet_app/src/establishments/data/request/establishmentRequest.dart';
import 'package:vet_app/src/establishments/domain/show/showVetController.dart';

class EditBaseController extends GetxController {
  final _repo = EstablishmentRepository();

  final nameControl = TextEditingController();
  final phoneControl = TextEditingController();
  final addressControl = TextEditingController();

  final showVetController = Get.find<ShowVetController>();

  RxString _vetTypeId = ''.obs;
  String get vetTypeId => _vetTypeId.value;
  set vetTypeId(String value) => _vetTypeId.value = value;

  var entityBase = new EstablecimientoEntity().obs;

  List<int> services = [];

  @override
  void onInit() {
    vetTypeId = showVetController.establishment.value.typeId.toString();
    nameControl.text = showVetController.establishment.value.name;
    addressControl.text = showVetController.establishment.value.address;
    phoneControl.text = showVetController.establishment.value.phone;

    showVetController.establishment.value.services.forEach((element) {
      services.add(element.id);
    });

    entityBase.update((val) {
      val.name = showVetController.establishment.value.name;
      val.phone = showVetController.establishment.value.phone;
      val.ruc = showVetController.establishment.value.ruc;
      val.website = showVetController.establishment.value.website;
      val.typeId = showVetController.establishment.value.typeId;
      val.address = showVetController.establishment.value.address;
      val.reference = showVetController.establishment.value.reference;
      val.latitude = showVetController.establishment.value.latitude;
      val.longitude = showVetController.establishment.value.longitude;
      val.services = services;
    });

    super.onInit();
  }

  void updateBase() => _updateBase();

  _updateBase() async {
    print('update base');

    entityBase.update((val) {
      val.name = nameControl.text;
      val.phone = phoneControl.text;
      val.address = addressControl.text;
      val.typeId = int.parse(vetTypeId);
    });

    print(jsonEncode(entityBase));
    await _repo.updateBase(entityBase.value, showVetController.argumentoId);

    showVetController.getByid();
    Get.back();
  }

  gpsDireccion(Prediction data) {
    _searchandNavigate(data);
  }

  _searchandNavigate(Prediction dato) async {
    if (addressControl.text.trim() != "") {
      addressControl.text = dato.name;

      final datoById = await _repo.getLatLngByPlaceId(dato.placeId);
      final location = datoById.result.geometry.location;

      entityBase.update((val) {
        val.latitude = location.lat;
        val.longitude = location.lng;
      });
    }
  }
}
