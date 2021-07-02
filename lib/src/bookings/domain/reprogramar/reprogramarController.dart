import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
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

    if (fecha.value.isEmpty) msgfecha.value = 'Ingrese fecha';
    if (hora.value.isEmpty) msghora.value = 'Ingrese hora';

    if (fecha.value.isEmpty || hora.value.isEmpty) {
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
      print(resp.statusCode);
      print(resp.body);
      if (resp.statusCode == 200) {
        reprogramando.value = false;
        

        final Map message = jsonDecode(resp.body);
        
        if(message.containsKey('message')){
          ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
            content: Text(
              message['message'],
            ),
            duration: Duration(seconds: 7),
            backgroundColor: Colors.black.withOpacity(0.85),
          ));
        }
        else{
          _homeController.getAllBookings();
          Navigator.popUntil(Get.context!, ModalRoute.withName(NameRoutes.home));
        }
      }
    }
    reprogramando.value = false;
  }
}
