

import 'model/calendarBookingModel.dart';
import 'model/calendarEventModel.dart';
import 'model/calendarEventResponse.dart';
import 'model/calendarNextdateModel.dart';

abstract class CalendarInterface {
  Future<CalendarBookingModel> getCalendarBookings(String idEstablishment, String date);
  Future<CalendarNextdateModel> getCalendarNextdates(String idEstablishment, String date);
  Future<CalendarEventModel> getCalendarEvents(String idEstablishment, String date);
  Future<CalendarEventResponse> newCalendarEvent(String idEstablishment, CalendarEvent newEvent);
}
