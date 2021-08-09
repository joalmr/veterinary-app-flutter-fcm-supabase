import 'package:get/get.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/_auth/data/auth_repository.dart';

class ConfigController extends GetxController {
  final authService = AuthRepository();

  void logOut() => _logout();

  Future<void> _logout() async {
    final int logged = await authService.logOut();
    if (logged == 200) Get.toNamed(NameRoutes.login);
  }
}
