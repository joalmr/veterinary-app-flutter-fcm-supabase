import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:vet_app/recursos/utils/datetimeFormat.dart';
import 'package:vet_app/components/forms/dateForm.dart';
import 'package:vet_app/components/forms/timeForm.dart';
import 'package:vet_app/routes/routes.dart';
import 'package:vet_app/src/home/data/bookingRepository.dart';
import '../homeController.dart';

class ReprogramarController extends GetxController {
  final bookingRepository = BookingRepository();
  final HomeController _homeController = Get.find();

  RxBool _reprogramando = false.obs;
  bool get reprogramando => _reprogramando.value;
  set reprogramando(bool value) => _reprogramando.value = value;

  RxBool _reprogramaBlock = false.obs;
  bool get reprogramaBlock => _reprogramaBlock.value;
  set reprogramaBlock(bool value) => _reprogramaBlock.value = value;

  RxBool _errorDateTime = false.obs;
  bool get errorDateTime => _errorDateTime.value;
  set errorDateTime(bool value) => _errorDateTime.value = value;

  RxString _fecha = "".obs;
  String get fecha => _fecha.value;
  set fecha(String value) => _fecha.value = value;

  RxString _hora = "".obs;
  String get hora => _hora.value;
  set hora(String value) => _hora.value = value;

  RxString _msgfecha = "".obs;
  String get msgfecha => _msgfecha.value;
  set msgfecha(String value) => _msgfecha.value = value;

  RxString _msghora = "".obs;
  String get msghora => _msghora.value;
  set msghora(String value) => _msghora.value = value;
////////////////////////////////////////////////////////////////////////////////

  reprogramar(idBooking) => _reprogramar(idBooking);

  Future<void> _reprogramar(String idBooking) async {
    reprogramando = true;

    final date = validaDate(fecha);
    final hour = validateTime(hora);

    if (date != null) msgfecha = date;
    if (hour != null) msghora = hour;

    if (date != null || hour != null) {
      errorDateTime = true;
      Timer(
        Duration(milliseconds: 7500),
        () => errorDateTime = false,
      );
    } else {
      String datetime = formatDateOut(
        valor: '$fecha $hora',
        formatIn: "dd-MM-yyyy HH:mm",
        formatOut: "yyyy-MM-dd HH:mm:00",
      );

      var resp = await bookingRepository.reschedule(idBooking, datetime);

      if (resp == 200) {
        reprogramando = false;
        _homeController.getAll();

        Navigator.popUntil(Get.context, ModalRoute.withName(NameRoutes.home));
      }
    }
    reprogramando = false;
  }
}
