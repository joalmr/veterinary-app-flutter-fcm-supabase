import 'dart:async';
import 'package:get/get.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/preferences/preferences_model.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/_auth/data/auth_repository.dart';
import 'package:vet_app/src/establishments/data/establishment_repository.dart';
import 'package:vet_app/src/home/domain/home_controller.dart';

class LoginController extends GetxController {
  final authService = AuthRepository();
  final stablishmentService = EstablishmentRepository();

  final _homeController = Get.find<HomeController>();

  String email = '';
  String password = '';

  RxBool errorLogIn = false.obs;
  RxBool btnLogIn = true.obs;

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

  Future<void> initHome() async {
    if (prefUser.vetDataHas() == false) {
      final temp = await stablishmentService.getFirst();
      VetStorage forStorage = VetStorage();
      forStorage.vetId = temp.id;
      forStorage.vetName = temp.name;
      forStorage.vetLogo = temp.logo;

      prefUser.vetData = vetStorageToJson(forStorage);

      _homeController.getVet();
      _homeController.getAllBookings();
    }
  }
}
