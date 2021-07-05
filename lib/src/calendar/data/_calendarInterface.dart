import 'model/calendarEventModel.dart';
import 'model/calendarEventResponse.dart';
import 'model/listBookingsModel.dart';
import 'model/listEventsModel.dart';
import 'model/listNextdateModel.dart';

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
