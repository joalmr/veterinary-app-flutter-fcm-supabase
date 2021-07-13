import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/resources/utils/preferences/preferences_model.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/__global/domain/global_controller.dart';
import 'package:vet_app/src/_auth/data/auth_repository.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';

class LoginController extends GetxController {
  final authService = AuthRepository();
  final stablishmentService = EstablishmentRepository();

  final _homeController = Get.find<HomeController>();
  final _global = Get.find<GlobalController>();

  String email = '';
  String password = '';

  final errorLogIn = false.obs;
  final btnLogIn = true.obs;
  final olvideBool = false.obs;
  final btnOlvide = true.obs;

  void logIn() => _login();
  Future<void> _login() async {
    btnLogIn.value = false;
    final int logged = await authService.login(email, password);
    if (logged == 200) {
      await initHome();
      btnLogIn.value = true;
      Get.offNamed(NameRoutes.home);
    } else {
      errorLogIn.value = true;
      btnLogIn.value = true;
      Timer(
        const Duration(milliseconds: 7500),
        () => errorLogIn.value = false,
      );
    }
  }

  void olvideContra(String email) => _olvideContra(email);
  _olvideContra(String email) async {
    btnOlvide.value = false;
    print(email);
    final int logged = await authService.forgotPassword(email);
    if (logged == 200) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text(
          'Se le ha enviado un email a su dirección ingresada',
          style: TextStyle(color: colorMain),
        ),
        duration: const Duration(seconds: 7),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: const Text(
          'Oops! ocurrió un error, inténtelo más tarde',
          style: TextStyle(color: colorRed),
        ),
        duration: const Duration(seconds: 5),
        backgroundColor: Colors.black.withOpacity(0.85),
      ));
    }

    btnOlvide.value = true;
  }

  Future<void> initHome() async {
    if (prefUser.vetDataHas() == false) {
      final temp = await stablishmentService.getFirst();
      final VetStorage forStorage = VetStorage();
      forStorage.vetId = temp.id;
      forStorage.vetName = temp.name;
      forStorage.vetLogo = temp.logo;

      prefUser.vetData = vetStorageToJson(forStorage);

      _homeController.getVet();
      _global.generalLoad();
    }
  }
}
