import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/data/model/establishmentModel.dart';

class StablishmentValue {
  RxBool _carga = true.obs;
  bool get carga => _carga.value;
  set carga(bool value) => _carga.value = value;

  RxList<EstablecimientoModel> establecimientos = <EstablecimientoModel>[].obs;

  EstablecimientoModel stablishment;
}
