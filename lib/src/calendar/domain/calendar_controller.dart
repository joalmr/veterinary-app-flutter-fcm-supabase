import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/components/snackbar.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/datetime_format.dart';
import 'package:vet_app/src/calendar/data/calendar_repository.dart';
import 'package:vet_app/src/calendar/data/model/calendar_booking_model.dart';
import 'package:vet_app/src/calendar/data/model/calendar_event_model.dart';
import 'package:vet_app/src/calendar/data/model/calendar_nextdate_model.dart';

class CalendarController extends GetxController {
  final _repo = CalendarRepository();

  // final _global = Get.find<GlobalController>();

  final calendarBookings = <CalendarBooking>[].obs;
  final calendarNextdates = <CalendarNextdate>[].obs;
  final calendarEvents = <CalendarEvent>[].obs;

  DateTime today = DateTime.now();
  final dateString = ''.obs;

  final valueMonth = DateTime.now().month.obs;
  final valueYear = DateTime.now().year.obs;

  final daysPerMonth = 0.obs;

  final listCalendarBooking = <dynamic>[].obs;
  final listCalendarNextDate = <dynamic>[].obs;
  final listCalendarEvent = <dynamic>[].obs;

  final cargando = true.obs;

  ///
  DateTime? tempDate;

  ///
  TimeOfDay pickedTime = TimeOfDay.now();

  RxString titulo = ''.obs;
  RxString fecha = ''.obs;
  RxString hora = ''.obs;
  RxString integrantes = ''.obs;
  RxString descripcion = ''.obs;

  @override
  void onInit() {
    loadCalendar();
    super.onInit();
  }

  void loadCalendar() {
    if (prefUser.tokenHas() && prefUser.vetDataHas()) {
      dateString.value = formatDateBasic(today);
      daysPerMonth.value =
          DateTime(valueYear.value, valueMonth.value + 1, 0).day;

      listasCalendario(today);
      tempDate = today;
    }
  }

  void monthMore() {
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

    final dateC = DateTime(valueYear.value, valueMonth.value);
    listasCalendario(dateC);
    tempDate = dateC;
  }

  void monthLess() {
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

    final dateC = DateTime(valueYear.value, valueMonth.value);
    listasCalendario(dateC);
    tempDate = dateC;
  }

  Future<void> listasCalendario(DateTime dateC) async {
    cargando.value = true;
    await listCalendarBookings(dateC);
    await listCalendarNextdate(dateC);
    await listCalendarEvents(dateC);
    cargando.value = false;
  }

  listCalendarBookings(DateTime date) => _listCalendarBookings(date);

  Future<void> _listCalendarBookings(DateTime date) async {
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

  listCalendarNextdate(DateTime date) => _listCalendarNextdate(date);

  Future<void> _listCalendarNextdate(DateTime date) async {
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

  listCalendarEvents(DateTime date) => _listCalendarEvents(date);

  Future<void> _listCalendarEvents(DateTime date) async {
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

  Future<void> _newCalendarEvent() async {
    if (titulo.value.isEmpty ||
        fecha.value.isEmpty ||
        hora.value.isEmpty ||
        integrantes.value.isEmpty ||
        descripcion.value.isEmpty) {
      snackBarMessage(
        message: 'Complete todos los campos',
      );
    } else {
      final tempEvent = CalendarEvent(
        title: titulo.value,
        date: fecha.value,
        time: hora.value,
        members: integrantes.value,
        description: descripcion.value,
      );

      await _repo.newCalendarEvent(prefUser.vetId!, tempEvent);

      valueMonth.value = toDateBasic(fecha.value).month;
      valueYear.value = toDateBasic(fecha.value).year;
      listasCalendario(toDateBasic(fecha.value));

      Timer(
        const Duration(milliseconds: 2000),
        () {
          Get.back();
        },
      );
    }
  }
}
