import 'package:get/get.dart';
import 'package:vet_app/src/home/data/bookingRepository.dart';
import 'package:vet_app/src/stablishments/data/establishmentRepository.dart';
import '../controller/homeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        stablishmentService: EstablishmentRepository(),
        bookingService: BookingRepository(),
      ),
    );
  }
}
