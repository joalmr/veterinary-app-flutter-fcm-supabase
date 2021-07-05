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

  void openApp() {
    if (prefUser.tokenHas() == true && prefUser.vetDataHas() == true) {
      Timer(const Duration(milliseconds: 2500),
          () => Get.offNamed(NameRoutes.home));
    } else {
      Timer(const Duration(milliseconds: 2500),
          () => Get.offNamed(NameRoutes.login));
    }
  }
}
