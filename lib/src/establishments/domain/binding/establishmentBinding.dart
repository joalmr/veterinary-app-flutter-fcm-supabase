import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';

import '../establishmentsController.dart';

class EstablishmentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EstablishmentsController>(
      () => EstablishmentsController(
        establishmentRepo: EstablishmentRepository(),
      ),
    );
  }
}
