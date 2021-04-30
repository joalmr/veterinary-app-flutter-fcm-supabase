import 'package:get/get.dart';

class BookingController extends GetxController {

  RxString condicion = "".obs;

  @override
  void onClose() {
    
    if(Get.context.width<900)
      Get.close(1);
    super.onClose();
  }
}