import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/bookings/data/bookingRepository.dart';
import 'package:vet_app/src/home/domain/homeController.dart';

class ReprogramarController extends GetxController {
  final bookingRepository = BookingRepository();
  final _homeController = Get.find<HomeController>();

  RxBool reprogramando = false.obs;
  RxBool reprogramaBlock = false.obs;
  RxBool errorDateTime = false.obs;

  RxString fecha = "".obs;
  RxString hora = "".obs;
  RxString msgfecha = "".obs;
  RxString msghora = "".obs;
////////////////////////////////////////////////////////////////////////////////

  reprogramar(idBooking) => _reprogramar(idBooking);

  Future<void> _reprogramar(String idBooking) async {
    reprogramando.value = true;

    if (fecha.isEmpty != null) msgfecha.value = 'Ingrese fecha';
    if (hora.isEmpty != null) msghora.value = 'Ingrese hora';

    if (fecha.isEmpty || hora.isEmpty) {
      errorDateTime.value = true;
      Timer(
        Duration(milliseconds: 7500),
        () => errorDateTime.value = false,
      );
    } else {
      String datetime = formatDateOut(
        valor: '$fecha $hora',
        formatIn: "yyyy-MM-dd HH:mm",
        formatOut: "yyyy-MM-dd HH:mm:00",
      );

      var resp = await bookingRepository.reschedule(idBooking, datetime);

      if (resp == 200) {
        reprogramando.value = false;
        _homeController.getAllBookings();

        Navigator.popUntil(Get.context, ModalRoute.withName(NameRoutes.home));
      }
    }
    reprogramando.value = false;
  }
}
