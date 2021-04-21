import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/components/forms/dateForm.dart';
import 'package:vet_app/components/forms/timeForm.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/home/data/bookingRepository.dart';
import '../homeController.dart';

class ReprogramarController extends GetxController {
  final bookingRepository = BookingRepository();
  final HomeController _homeController = Get.find();

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

    final date = validaDate(fecha.value);
    final hour = validateTime(hora.value);

    if (date != null) msgfecha.value = date;
    if (hour != null) msghora.value = hour;

    if (date != null || hour != null) {
      errorDateTime.value = true;
      Timer(
        Duration(milliseconds: 7500),
        () => errorDateTime.value = false,
      );
    } else {
      String datetime = formatDateOut(
        valor: '$fecha $hora',
        formatIn: "dd-MM-yyyy HH:mm",
        formatOut: "yyyy-MM-dd HH:mm:00",
      );

      var resp = await bookingRepository.reschedule(idBooking, datetime);

      if (resp == 200) {
        reprogramando.value = false;
        _homeController.getAll();

        Navigator.popUntil(Get.context, ModalRoute.withName(NameRoutes.home));
      }
    }
    reprogramando.value = false;
  }
}
