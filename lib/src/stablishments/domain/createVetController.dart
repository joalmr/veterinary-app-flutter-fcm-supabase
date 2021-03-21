import 'package:get/get.dart';
import 'package:vet_app/src/stablishments/data/establishmentEntity.dart';
import 'package:vet_app/src/stablishments/data/establishmentRepository.dart';
import 'values/createVetValue.dart';

class CreateVetController extends GetxController {
  final establishmentRepo = EstablishmentRepository();
  EstablecimientoEntity entity = new EstablecimientoEntity();
  final v = CreateVetValue();

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
    print('new vet');
    var arr = [1, 2, 3];

    // entity.name = 'A';
    // entity.phone = '988111222';
    // entity.ruc = '12345678901';
    // entity.website = 'www.proypet.com';
    //
    entity.typeId = 1;
    entity.address = "Misionero Salas 529, Callao, Perú";
    entity.latitude = 0;
    entity.longitude = 0;
    entity.services = arr;
    entity.reference = "Cerca";

    await establishmentRepo.setNew(entity);
  }
}
