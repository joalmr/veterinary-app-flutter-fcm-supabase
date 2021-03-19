import 'package:get/get.dart';
import 'globalController.dart';

class GlobalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GlobalController>(
      () => GlobalController(),
    );
    // Get.lazyPut<HomeController>(() => HomeController());
  }
}
