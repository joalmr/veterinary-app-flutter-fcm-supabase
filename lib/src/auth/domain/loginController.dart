import 'dart:async';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/auth/data/authRepository.dart';
import 'package:vet_app/src/stablishments/data/establishmentRepository.dart';

class LoginController extends GetxController {
  final authService = AuthRepository();
  final stablishmentService = EstablishmentRepository();

  String email = '';
  String password = '';

  RxBool errorLogIn = false.obs;
  RxBool btnLogIn = true.obs;

  @override
  void onInit() {
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

  logIn() => _login();

  Future<void> _login() async {
    btnLogIn.value = false;
    int logged = await authService.login(email, password);
    if (logged == 200) {
      await initHome();
      btnLogIn.value = true;
      Get.offNamed(NameRoutes.home);
    } else {
      errorLogIn.value = true;
      btnLogIn.value = true;
      Timer(
        Duration(milliseconds: 7500),
        () => errorLogIn.value = false,
      );
    }
  }

  Future<void> initHome() async {
    if (!prefUser.vetIdHas() ||
        !prefUser.vetNameHas() ||
        !prefUser.vetLogoHas()) {
      var temp = await stablishmentService.getFirst();
      prefUser.vetId = temp.id;
      prefUser.vetName = temp.name;
      prefUser.vetLogo = temp.logo;
    }
  }
}
