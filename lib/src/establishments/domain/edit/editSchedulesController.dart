import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/establishments/domain/show/showVetController.dart';

class EditSchedulesController extends GetxController {
  final _repo = EstablishmentRepository();
  final showVetController = Get.find<ShowVetController>();

  @override
  void onClose() {
    super.onClose();
    // showVetController.initialTab.value = 3;
  }
}
