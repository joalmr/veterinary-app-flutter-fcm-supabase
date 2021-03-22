import 'package:get/get.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/stablishments/data/entity/establishmentEntity.dart';
import 'package:vet_app/src/stablishments/data/entity/priceEstEntity.dart';
import 'package:vet_app/src/stablishments/data/establishmentRepository.dart';
import 'values/createVetValue.dart';

class CreateVetController extends GetxController {
  final establishmentRepo = EstablishmentRepository();

  final v = CreateVetValue();

  EstablecimientoEntity entity = new EstablecimientoEntity();
  PriceEstablecimientoEntity prices = new PriceEstablecimientoEntity();

  @override
  void onInit() {
    _getService();
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

  _getService() async {
    var lista = await establishmentRepo.getServiceVet();
    v.servicesVet.clear();
    v.servicesVet.addAll(lista);
  }

  void add2List(int numero) {
    if (!v.servicesVetSet.contains(numero))
      v.servicesVetSet.add(numero);
    else {
      if (v.servicesVetSet.length > 1) {
        v.servicesVetSet.remove(numero);
      }
    }
  }

  newEstablishment() => _newEstablishment();

  _newEstablishment() async {
    print('new vet');
    entity.typeId = int.parse(v.vetType);
    entity.address = "Misionero Salas, Callao, Perú";
    entity.latitude = -12.002784;
    entity.longitude = -77.100593;
    entity.services = v.servicesVetSet;
    entity.reference = "Cerca";

    var resp = await establishmentRepo.setNew(entity);
    v.idVet = resp[1];
    print(resp[0]);
    print(resp[1]);
    if (resp[0] == 200) v.selected++;
  }

  setFinaliza() {
    setPrices();
    setDescription();
  }

  setPrices() => _setPrices();
  setDescription() => _setDescription();

  _setPrices() async {
    prices.consultationPriceFrom = v.moneyConsulta.numberValue;
    prices.dewormingPriceFrom = v.moneyDesparasita.numberValue;
    prices.groomingPriceFrom = v.moneyGrooming.numberValue;
    prices.vaccinationPriceFrom = v.moneyVacuna.numberValue;

    await establishmentRepo.setPrices(v.idVet, prices);
  }

  _setDescription() async {
    await establishmentRepo.setDescription(v.idVet, v.description);
  }

  bool get ename => v.nameVet.text.isEmpty;
  bool get ephone => v.phoneVet.text.isEmpty;
  bool get eruc => v.rucVet.text.isEmpty;
  bool get eweb => v.webVet.text.isEmpty;
  bool get eservices => v.servicesVetSet.length == 0;

  validaStep1() {
    if (ename || ephone || eruc || eweb || eservices) {
      Get.snackbar(
        'Error',
        'Llene todos los campos',
        backgroundColor: colorRed.withAlpha(180),
        colorText: colorRed3,
      );
    } else {
      if (v.selected < 4) v.selected++;
    }
  }
}
