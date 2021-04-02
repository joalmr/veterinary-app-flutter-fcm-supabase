import 'package:get/get.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/_auth/login/data/authRepository.dart';

class ConfigController extends GetxController {
  final authService = AuthRepository();

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

  logOut() => _logout();

  _logout() async {
    int logged = await authService.logOut();
    if (logged == 200) Get.toNamed(NameRoutes.login);
  }
}
