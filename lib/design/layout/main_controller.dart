import 'package:get/get.dart';
import 'package:vet_app/src/_auth/domain/push_controller.dart';

class MainLaoutController extends GetxController {
  PushController pushController = PushController();
  //TODO: firebase
  @override
  void onInit() {
    super.onInit();
    pushController.firebaseConfigure();
  }
}
