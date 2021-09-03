import 'dart:async';
import 'package:get/get.dart';
import 'package:vet_app/_supabase/auth/auth_repo.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/preferences/preferences_model.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/__global/domain/global_controller.dart';
import 'package:vet_app/src/__new_from_web/new_establishment.dart';
import 'package:vet_app/src/_auth/data/auth_repository.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/establishments/presentation/pages/_children/create/crea_vet.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';

import 'push_controller.dart';

class LoginController extends GetxController {
  final authService = AuthRepository();
  final authSupa = AuthSupaRepo();
  final establishmentService = EstablishmentRepository();

  // final pushController = PushController();

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
    final establishment = await establishmentService.getAll();
    // pushController.firebase(); //TODO: firebase
    print(establishment!.length);
    if (establishment.isEmpty) {
      // prefUser.hasMenu = false;
      btnLogIn.value = true;
      if (GetPlatform.isWeb) {
        Get.off(NewEstablishment());
      } else {
        Get.off(CreateVetMain(), arguments: 'new-estab');
      }
    } else {
      //if (prefUser.vetDataHas() == false)
      // prefUser.hasMenu = true;
      final temp = await establishmentService.getFirst();
      final VetStorage forStorage = VetStorage();
      forStorage.vetId = temp.id;
      forStorage.vetName = temp.name;
      forStorage.vetLogo = temp.logo;

      prefUser.vetData = vetStorageToJson(forStorage);
      authSupa.getEstablishment(temp.id!, temp.name!);

      _global.generalLoad();
      _homeController.getVet();

      btnLogIn.value = true;

      Get.offNamed(NameRoutes.home);
    }
  }
}
