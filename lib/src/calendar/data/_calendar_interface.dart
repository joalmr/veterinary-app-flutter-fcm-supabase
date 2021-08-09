import 'model/calendar_event_model.dart';
import 'model/calendar_event_response.dart';
import 'model/list_bookings_model.dart';
import 'model/list_events_model.dart';
import 'model/list_nextdate_model.dart';

abstract class CalendarInterface {
  Future<CalendarEventResponse> newCalendarEvent(
      String idEstablishment, CalendarEvent newEvent);

  Future<ListBookingsModel?> listCalendarBookings(
      String idEstablishment, String date);
  Future<ListNextdateModel?> listCalendarNextdate(
      String idEstablishment, String date);
  Future<ListEventsModel?> listCalendarEvents(
      String idEstablishment, String date);
}
