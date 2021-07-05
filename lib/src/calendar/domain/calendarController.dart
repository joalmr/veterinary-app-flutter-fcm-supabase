import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/calendar/data/calendarRepository.dart';
import 'package:vet_app/src/calendar/data/model/calendarBookingModel.dart';
import 'package:vet_app/src/calendar/data/model/calendarEventModel.dart';
import 'package:vet_app/src/calendar/data/model/calendarNextdateModel.dart';

class CalendarController extends GetxController {
  final _repo = CalendarRepository();

  final calendarBookings = <CalendarBooking>[].obs;
  final calendarNextdates = <CalendarNextdate>[].obs;
  final calendarEvents = <CalendarEvent>[].obs;

  var today = DateTime.now();
  final dateString = ''.obs;

  final valueMonth = DateTime.now().month.obs;
  final valueYear = DateTime.now().year.obs;

  final daysPerMonth = 0.obs;

  final listCalendarBooking = <dynamic>[].obs;
  final listCalendarNextDate = <dynamic>[].obs;
  final listCalendarEvent = <dynamic>[].obs;

  final cargando = true.obs;

  ///
  var tempDate;

  ///
  var pickedTime = TimeOfDay.now();

  RxString titulo = ''.obs;
  RxString fecha = ''.obs;
  RxString hora = ''.obs;
  RxString integrantes = ''.obs;
  RxString descripcion = ''.obs;

  ///

  @override
  void onInit() {
    super.onInit();
    dateString.value = formatDateBasic(today);
    daysPerMonth.value =
        DateTime(valueYear.value, (valueMonth.value + 1), 0).day;

    listasCalendario(today);
    tempDate = today;
  }

  monthMore() {
    if (valueMonth.value < 12) {
      valueMonth.value = valueMonth.value + 1;
      daysPerMonth.value =
          DateTime(valueYear.value, valueMonth.value + 1, 0).day;
    } else {
      valueYear.value = valueYear.value + 1;
      valueMonth.value = 1;
      daysPerMonth.value =
          DateTime(valueYear.value, valueMonth.value + 1, 0).day;
    }

    final dateC = DateTime(valueYear.value, valueMonth.value, 1);
    listasCalendario(dateC);
    tempDate = dateC;
  }

  monthLess() {
    if (valueMonth.value > 1) {
      valueMonth.value = valueMonth.value - 1;
      daysPerMonth.value =
          DateTime(valueYear.value, valueMonth.value + 1, 0).day;
    } else {
      valueYear.value = valueYear.value - 1;
      valueMonth.value = 12;
      daysPerMonth.value =
          DateTime(valueYear.value, valueMonth.value + 1, 0).day;
    }

    var dateC = DateTime(valueYear.value, valueMonth.value, 1);
    listasCalendario(dateC);
    tempDate = dateC;
  }

  listasCalendario(dateC) async {
    cargando.value = true;
    await listCalendarBookings(dateC);
    await listCalendarNextdate(dateC);
    await listCalendarEvents(dateC);
    cargando.value = false;
  }

  listCalendarBookings(date) => _listCalendarBookings(date);
  _listCalendarBookings(date) async {
    final response =
        await _repo.listCalendarBookings(prefUser.vetId!, formatDateYM(date));

    listCalendarBooking.clear();
    listCalendarBooking.length = 32;

    if (response != null) {
      response.result!.forEach((key, value) {
        listCalendarBooking[toDateBasic(key).day] = value;
      });
    }
  }

  listCalendarNextdate(date) => _listCalendarNextdate(date);
  _listCalendarNextdate(date) async {
    final response =
        await _repo.listCalendarNextdate(prefUser.vetId!, formatDateYM(date));

    listCalendarNextDate.clear();
    listCalendarNextDate.length = 32;

    if (response != null) {
      response.result!.forEach((key, value) {
        listCalendarNextDate[toDateBasic(key).day] = value;
      });
    }
  }

  listCalendarEvents(date) => _listCalendarEvents(date);
  _listCalendarEvents(date) async {
    final response =
        await _repo.listCalendarEvents(prefUser.vetId!, formatDateYM(date));

    listCalendarEvent.clear();
    listCalendarEvent.length = 32;

    if (response != null) {
      response.result!.forEach((key, value) {
        listCalendarEvent[toDateBasic(key).day] = value;
      });
    }
  }

  ///
  ///
  newCalendarEvent() => _newCalendarEvent();
  _newCalendarEvent() async {
    if (titulo.value.isEmpty ||
        fecha.value.isEmpty ||
        hora.value.isEmpty ||
        integrantes.value.isEmpty ||
        descripcion.value.isEmpty) {
      print('Complete todos los campos');
    } else {
      final tempEvent = CalendarEvent(
        title: titulo.value,
        date: fecha.value,
        time: hora.value,
        members: integrantes.value,
        description: descripcion.value,
      );

      await _repo.newCalendarEvent(prefUser.vetId!, tempEvent);

      Timer(
        const Duration(milliseconds: 2000),
        () {
          Get.back();
        },
      );
    }
  }
}
