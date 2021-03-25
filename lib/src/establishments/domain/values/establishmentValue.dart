import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/model/establishmentModelLite.dart';
import 'package:vet_app/src/establishments/data/model/establishmet.dart';

class EstablishmentValue {
  RxBool _carga = true.obs;
  bool get carga => _carga.value;
  set carga(bool value) => _carga.value = value;

  RxBool _cargaById = false.obs;
  bool get cargaById => _cargaById.value;
  set cargaById(bool value) => _cargaById.value = value;

  RxList<EstablecimientoModelLite> establecimientos =
      <EstablecimientoModelLite>[].obs;

  Rx<EstablishmentModal> _establishment = EstablishmentModal().obs;
  EstablishmentModal get establishment => _establishment.value;
  set establishment(EstablishmentModal value) => _establishment.value = value;
}
