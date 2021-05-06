import 'package:vet_app/src/calendar/data/model/calendarNextdateModel.dart';
import 'package:vet_app/src/calendar/data/model/calendarEventResponse.dart';
import 'package:vet_app/src/calendar/data/model/calendarEventModel.dart';
import 'package:vet_app/src/calendar/data/model/calendarBookingModel.dart';
import '_calendarInterface.dart';
import 'package:http/http.dart' as http;

class CalendarApi extends CalendarInterface {
  @override
  Future<CalendarBookingModel> getCalendarBookings(String idEstablishment, String date) {
      // TODO: implement getCalendarBookings
      throw UnimplementedError();
    }
  
    @override
    Future<CalendarEventModel> getCalendarEvents(String idEstablishment, String date) {
      // TODO: implement getCalendarEvents
      throw UnimplementedError();
    }
  
    @override
    Future<CalendarNextdateModel> getCalendarNextdates(String idEstablishment, String date) {
      // TODO: implement getCalendarNextdates
      throw UnimplementedError();
    }
  
    @override
    Future<CalendarEventResponse> newCalendarEvent(String idEstablishment, CalendarEvent newEvent) {
    // TODO: implement newCalendarEvent
    throw UnimplementedError();
  }

}