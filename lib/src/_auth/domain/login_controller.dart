import 'dart:async';
import 'package:get/get.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/preferences/preferences_model.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/__global/domain/global_controller.dart';
import 'package:vet_app/src/_auth/data/auth_repository.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/crea_vet.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';

import 'push_controller.dart';

class LoginController extends GetxController {
  final authService = AuthRepository();
  final stablishmentService = EstablishmentRepository();

  final pushController = PushController();

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
      final establishment = await stablishmentService.getAll();

      if (establishment.isEmpty) {
        btnLogIn.value = true;
        //is web?
        pushController.firebase();
        Get.off(CreateVetMain());
      } else {
        await initHome();
        pushController.firebase(); //TODO: firebase
        btnLogIn.value = true;
        Get.offNamed(NameRoutes.home);
      }
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

    final int logged = await authService.forgotPassword(email);
    if (logged == 200) {
      snackBarMessage(
        message: 'Se le ha enviado un email a su dirección ingresada',
        seconds: 7,
      );
    } else {
      snackBarMessage(
        type: TypeSnackBarName.ERROR,
        message: 'Oops! ocurrió un error, inténtelo más tarde',
        seconds: 5,
      );
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

      _global.generalLoad();
      _homeController.getVet();
    }
  }
}
