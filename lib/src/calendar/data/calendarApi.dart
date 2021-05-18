import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/headerHttp.dart';
import 'package:vet_app/src/calendar/data/model/calendarEventResponse.dart';
import 'package:vet_app/src/calendar/data/model/calendarEventModel.dart';
import 'package:vet_app/src/calendar/data/model/listBookingsModel.dart';
import 'package:vet_app/src/calendar/data/model/listNextdateModel.dart';
import 'package:vet_app/src/calendar/data/model/listEventsModel.dart';
import '_calendarInterface.dart';
import 'package:http/http.dart' as http;

class CalendarApi extends CalendarInterface {
  // @override
  // Future<CalendarBookingModel> getCalendarBookings(String idEstablishment, String date) async {
  //   final url = Uri.https(
  //     urlBase, 
  //     '/api/client/establishment/$idEstablishment/calendar/bookings',
  //     {"date": date},
  //   );
    
  //   http.Response response = await http.get(url, headers: headersToken());
  //   return calendarBookingModelFromJson(response.body);
  // }
  
  // @override
  // Future<CalendarEventModel> getCalendarEvents(String idEstablishment, String date) async {
  //   final url = Uri.https(
  //     urlBase, 
  //     '/api/client/establishment/$idEstablishment/calendar/events',
  //     {"date": date},
  //   );

  //   http.Response response = await http.get(url, headers: headersToken());
  //   return calendarEventModelFromJson(response.body);
  // }

  // @override
  // Future<CalendarNextdateModel> getCalendarNextdates(String idEstablishment, String date) async {
  //   final url = Uri.https(
  //     urlBase, 
  //     '/api/client/establishment/$idEstablishment/calendar/nextdate',
  //     {"date": date},
  //   );

  //   http.Response response = await http.get(url, headers: headersToken());
  //   return calendarNextdateModelFromJson(response.body);
  // }
  
  @override
  Future<CalendarEventResponse> newCalendarEvent(String idEstablishment, CalendarEvent newEvent) async {
    // TODO: implement newCalendarEvent
    throw UnimplementedError();
  }
//?
  @override
  Future<ListBookingsModel> listCalendarBookings(String idEstablishment, String date) async {
    try{
      final url = Uri.https(
        urlBase, 
        '/api/client/establishment/$idEstablishment/calendar/bookings',
        {"date": date},
      );
      
      http.Response response = await http.get(url, headers: headersToken());
      
      return listBookingsModelFromJson(response.body);
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<ListEventsModel> listCalendarEvents(String idEstablishment, String date) async {
    try{
      final url = Uri.https(
        urlBase, 
        '/api/client/establishment/$idEstablishment/calendar/events',
        {"date": date},
      );

      http.Response response = await http.get(url, headers: headersToken());
      return listEventsModelFromJson(response.body);
    }
    catch(e){
      return null;
    }
  }

  @override
  Future<ListNextdateModel> listCalendarNextdate(String idEstablishment, String date) async {
    try{
      final url = Uri.https(
        urlBase, 
        '/api/client/establishment/$idEstablishment/calendar/nextdate',
        {"date": date},
      );

      http.Response response = await http.get(url, headers: headersToken());
      return listNextdateModelFromJson(response.body);
    }
    catch(e){
      return null;
    }
}

}