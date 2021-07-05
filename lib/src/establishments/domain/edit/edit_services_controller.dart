import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/data/model/service_model.dart';
import 'package:vet_app/src/establishments/data/request/establishment_request.dart';
import 'package:vet_app/src/establishments/domain/show/show_vet_controller.dart';

import '../establishments_controller.dart';

class EditServicesController extends GetxController {
  final _repo = EstablishmentRepository();
  final showVetController = Get.find<ShowVetController>();
  final vetController = Get.find<EstablishmentsController>();

  var servicesVet = <ServiceVetModel>[].obs;
  var servicesVetSet = <int>[].obs;
  var entityBase = new EstablecimientoEntity().obs;

  @override
  void onInit() {
    _getService();
    showVetController.establishment.value.services!.forEach((element) {
      servicesVetSet.add(element.id!);
    });
    entityBase.update((val) {
      val!.name = showVetController.establishment.value.name;
      val.phone = showVetController.establishment.value.phone;
      val.ruc = showVetController.establishment.value.ruc;
      val.website = showVetController.establishment.value.website;
      val.typeId = showVetController.establishment.value.typeId;
      val.address = showVetController.establishment.value.address;
      val.reference = showVetController.establishment.value.reference;
      val.latitude = showVetController.establishment.value.latitude;
      val.longitude = showVetController.establishment.value.longitude;
      val.services = servicesVetSet;
    });
    super.onInit();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   showVetController.initialTab.value = 1;
  // }

  _getService() async {
    var lista = await _repo.getServiceVet();
    servicesVet.clear();
    servicesVet.addAll(lista);
  }

  void add2List(int numero) {
    if (!servicesVetSet.contains(numero))
      servicesVetSet.add(numero);
    else {
      if (servicesVetSet.length > 1) {
        servicesVetSet.remove(numero);
      }
    }
  }

  void updateServices() => _updateServices();

  _updateServices() async {
    entityBase.update((val) {
      val!.services = servicesVetSet;
    });

    await _repo.updateBase(entityBase.value, showVetController.argumentoId!);

    showVetController.getByid();
    vetController.getAll();
    Get.back();
    showVetController.initialTab.value = 0;
  }
}
