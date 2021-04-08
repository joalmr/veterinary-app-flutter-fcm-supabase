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

  RxString _vetType = ''.obs;
  String get vetType => _vetType.value;
  set vetType(String value) => _vetType.value = value;

  @override
  void onInit() {
    vetType = "1"; //showVetController.establishment.
    nameControl.text = showVetController.establishment.name;
    addressControl.text = showVetController.establishment.address;
    phoneControl.text = "994840098"; //showVetController.establishment
    super.onInit();
  }

  void updateBase() => _updateBase();

  _updateBase() async {
    print('update base');
    var datosBase = new EstablecimientoEntity();

    datosBase.name = nameControl.text;
    datosBase.phone = phoneControl.text;
    datosBase.address = addressControl.text;
    datosBase.typeId = int.parse(vetType);
    //
    datosBase.latitude = 40.32;
    datosBase.longitude = 52.32;

    await _repo.updateBase(datosBase, showVetController.argumentoId);

    showVetController.getByid();
    Get.back();
  }

  gpsDireccion(Prediction data) {
    _searchandNavigate(data);
  }

  _searchandNavigate(Prediction dato) async {
    if (addressControl.text.trim() != "") {
      addressControl.text = dato.name;
      // datosBase.address = dato.name;

      // marcador.clear();
      // final places = new GoogleMapsPlaces(apiKey: keyMap);
      // final mapdata = await places.getDetailsByPlaceId(dato.placeId);

      // update(['xmap']);
    }
  }
}
