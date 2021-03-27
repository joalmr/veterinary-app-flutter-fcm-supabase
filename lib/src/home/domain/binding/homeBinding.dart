import 'package:get/get.dart';
import 'package:vet_app/src/establishments/data/establishmentRepository.dart';
import 'package:vet_app/src/home/data/bookingApi.dart';
import 'package:vet_app/src/home/data/bookingRepository2.dart';
import '../controller/homeController.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        establishmentService: EstablishmentRepository(),
        bookingService: BookingRepository(),
      ),
    );
  }
}
