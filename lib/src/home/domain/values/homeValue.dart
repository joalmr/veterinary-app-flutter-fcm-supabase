import 'package:get/get.dart';
import 'package:vet_app/src/home/data/model/bookingModel.dart';

class HomeValue {
  RxBool _carga = true.obs;
  bool get carga => _carga.value;
  set carga(bool value) => _carga.value = value;

  RxBool _cargaConfirmar = false.obs;
  bool get cargaConfirmar => _cargaConfirmar.value;
  set cargaConfirmar(bool value) => _cargaConfirmar.value = value;

  RxString _nameVet = "".obs;

  String get nameVet => _nameVet.value;
  set nameVet(String value) => _nameVet.value = value;

  RxList<ReservaModel> reservas = <ReservaModel>[].obs;
}
