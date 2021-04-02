import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vet_app/assets/utils/datetimeFormat.dart';
import 'package:vet_app/components/forms/dateForm.dart';
import 'package:vet_app/components/forms/timeForm.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/home/data/bookingRepository.dart';
import '../homeController.dart';
import 'reprogramaValue.dart';

class ReprogramarController extends GetxController {
  final bookingRepository = BookingRepository();
  final v = ReprogramaValue();

  final HomeController _homeController = Get.find();
////////////////////////////////////////////////////////////////////////////////

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

  reprogramar(idBooking) => _reprogramar(idBooking);

  Future<void> _reprogramar(String idBooking) async {
    v.reprogramando = true;

    final date = validaDate(v.fecha);
    final hour = validateTime(v.hora);

    if (date != null) v.msgfecha = date;
    if (hour != null) v.msghora = hour;

    if (date != null || hour != null) {
      v.errorDateTime = true;
      Timer(
        Duration(milliseconds: 7500),
        () => v.errorDateTime = false,
      );
    } else {
      String datetime = formatDateOut(
        valor: '${v.fecha} ${v.hora}',
        formatIn: "dd-MM-yyyy HH:mm",
        formatOut: "yyyy-MM-dd HH:mm:00",
      );

      var resp = await bookingRepository.reschedule(idBooking, datetime);

      if (resp == 200) {
        v.reprogramando = false;
        _homeController.getAll();

        Navigator.popUntil(Get.context, ModalRoute.withName(NameRoutes.home));
      }
    }
    v.reprogramando = false;
  }
}
