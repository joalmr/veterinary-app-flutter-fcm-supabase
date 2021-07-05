import 'dart:async';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/routes/routes.dart';

class GlobalController extends GetxController {
  bool init = false;
  @override
  void onInit() {
    openApp();
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

  openApp() {
    if (prefUser.tokenHas() && prefUser.vetDataHas()) {
      Timer(Duration(milliseconds: 2500), () => Get.offNamed(NameRoutes.home));
    } else {
      Timer(Duration(milliseconds: 2500), () => Get.offNamed(NameRoutes.login));
    }
  }
}
