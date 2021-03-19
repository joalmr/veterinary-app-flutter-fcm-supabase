import 'package:get/get.dart';

class VetController extends GetxController {
  String vet;

  @override
  void onInit() {
    vet = Get.parameters['user'];
    super.onInit();
  }

  @override
  void onReady() {
    //
    super.onReady();
  }

  @override
  void onClose() {
    //
    super.onClose();
  }
}
