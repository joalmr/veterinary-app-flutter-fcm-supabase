import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/data/establishmentEntity.dart';
import 'package:vet_app/src/stablishments/data/establishmentRepository.dart';

class EstablishmentsController extends GetxController {
  final establishmentRepo = EstablishmentRepository();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  newEstablishment() => _newEstablishment();

  _newEstablishment() async {
    EstablecimientoEntity _entity = new EstablecimientoEntity();

    var arr = [1, 2, 3];

    _entity.name = "Par";
    _entity.phone = "99933388";
    _entity.ruc = "22002200220";
    _entity.typeId = 1;
    _entity.address = "Misionero Salas 529, Callao, Perú";
    _entity.latitude = 0;
    _entity.longitude = 0;
    _entity.services = arr;
    _entity.website = "www.proypet.com";
    _entity.reference = "Cerca";

    await establishmentRepo.setNew(_entity);
  }
}
