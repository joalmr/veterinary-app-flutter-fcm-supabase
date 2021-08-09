import 'package:vet_app/src/calendar/data/model/calendar_event_response.dart';
import 'package:vet_app/src/calendar/data/model/calendar_event_model.dart';
import 'package:vet_app/src/calendar/data/model/list_bookings_model.dart';
import 'package:vet_app/src/calendar/data/model/list_nextdate_model.dart';
import 'package:vet_app/src/calendar/data/model/list_events_model.dart';
import '_calendar_interface.dart';
import 'calendar_api.dart';

class CalendarRepository extends CalendarInterface {
  final _api = CalendarApi();

  @override
  Future<CalendarEventResponse> newCalendarEvent(
      String idEstablishment, CalendarEvent newEvent) {
    return _api.newCalendarEvent(idEstablishment, newEvent);
  }

  @override
  Future<ListBookingsModel?> listCalendarBookings(
      String idEstablishment, String date) {
    return _api.listCalendarBookings(idEstablishment, date);
  }

  @override
  Future<ListEventsModel?> listCalendarEvents(
      String idEstablishment, String date) {
    return _api.listCalendarEvents(idEstablishment, date);
  }

  @override
  Future<ListNextdateModel?> listCalendarNextdate(
      String idEstablishment, String date) {
    return _api.listCalendarNextdate(idEstablishment, date);
  }
}
