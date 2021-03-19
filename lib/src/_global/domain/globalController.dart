import 'dart:async';

import 'package:get/get.dart';
import 'package:vet_app/routes/routes.dart';

class GlobalController extends GetxController {
  GlobalController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    openApp();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  openApp() {
    Timer(Duration(milliseconds: 4000), () => Get.offNamed(NameRoutes.home));
  }
}
