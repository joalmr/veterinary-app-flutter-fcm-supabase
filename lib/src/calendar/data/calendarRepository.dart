import 'package:vet_app/src/calendar/data/model/calendarEventResponse.dart';
import 'package:vet_app/src/calendar/data/model/calendarEventModel.dart';
import 'package:vet_app/src/calendar/data/model/listBookingsModel.dart';
import 'package:vet_app/src/calendar/data/model/listNextdateModel.dart';
import 'package:vet_app/src/calendar/data/model/listEventsModel.dart';
import '_calendarInterface.dart';
import 'calendarApi.dart';

class CalendarRepository extends CalendarInterface{
  final _api = CalendarApi();

  @override
  Future<CalendarEventResponse> newCalendarEvent(String idEstablishment, CalendarEvent newEvent) {
    return _api.newCalendarEvent(idEstablishment, newEvent);
  }

  @override
  Future<ListBookingsModel> listCalendarBookings(String idEstablishment, String date) {
    return _api.listCalendarBookings(idEstablishment, date);
  }

  @override
  Future<ListEventsModel> listCalendarEvents(String idEstablishment, String date) {
    return _api.listCalendarEvents(idEstablishment, date);
  }

  @override
  Future<ListNextdateModel> listCalendarNextdate(String idEstablishment, String date) {
    return _api.listCalendarNextdate(idEstablishment, date);
  }

}