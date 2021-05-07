import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/datetimeFormat.dart';
import 'package:vet_app/src/calendar/data/calendarRepository.dart';
import 'package:vet_app/src/calendar/data/model/calendarBookingModel.dart';
import 'package:vet_app/src/calendar/data/model/calendarEventModel.dart';
import 'package:vet_app/src/calendar/data/model/calendarNextdateModel.dart';

class CalendarController extends GetxController {
  final _repo = CalendarRepository();

  var calendarBookings = <CalendarBooking>[].obs;
  var calendarNextdates = <CalendarNextdate>[].obs;
  var calendarEvents = <CalendarEvent>[].obs;

  var today = DateTime.now();
  var dateString = ''.obs;

  @override
  void onInit() {
    super.onInit();
    dateString.value = formatDateBasic(today);
    getCalendarBookings();
    getCalendarNextdates();
    getCalendarEvents();
  }

  getCalendarBookings()=>_getCalendarBookings();
  _getCalendarBookings() async {
    calendarBookings.clear();
    final response = await _repo.getCalendarBookings(prefUser.vetId, dateString.value);
    calendarBookings.addAll(response.result);
    print('bookings ${calendarBookings.length}');
  }

  getCalendarNextdates()=>_getCalendarNextdates();
  _getCalendarNextdates() async {
    calendarNextdates.clear();
    final response = await _repo.getCalendarNextdates(prefUser.vetId, dateString.value);
    calendarNextdates.addAll(response.result);
    print('nextdates ${calendarNextdates.length}');
  }

  getCalendarEvents()=>_getCalendarEvents();
  _getCalendarEvents() async {
    calendarEvents.clear();
    final response = await _repo.getCalendarEvents(prefUser.vetId, '2021-05-15');
    calendarEvents.addAll(response.result);
    print('events ${calendarEvents.length}');
  }
}
