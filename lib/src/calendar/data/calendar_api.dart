import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/header_http.dart';
import 'package:vet_app/src/calendar/data/model/calendar_event_model.dart';
import 'package:vet_app/src/calendar/data/model/calendar_event_response.dart';
import 'package:vet_app/src/calendar/data/model/list_bookings_model.dart';
import 'package:vet_app/src/calendar/data/model/list_events_model.dart';
import 'package:vet_app/src/calendar/data/model/list_nextdate_model.dart';

import '_calendar_interface.dart';

class CalendarApi extends CalendarInterface {
  @override
  Future<CalendarEventResponse> newCalendarEvent(
      String idEstablishment, CalendarEvent newEvent) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$idEstablishment/calendar/event',
    );

    final http.Response response = await http.post(url,
        headers: headersToken(), body: jsonEncode(newEvent));

    final resp = calendarEventResponseFromJson(response.body);

    return resp;
  }

//?
  @override
  Future<ListBookingsModel?> listCalendarBookings(
      String idEstablishment, String date) async {
    try {
      final url = Uri.https(
        urlBase!,
        '/api/client/establishment/$idEstablishment/calendar/bookings',
        {'date': date},
      );

      final http.Response response = await http.get(
        url,
        headers: headersToken(),
      );

      return listBookingsModelFromJson(response.body);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ListEventsModel?> listCalendarEvents(
      String idEstablishment, String date) async {
    try {
      final url = Uri.https(
        urlBase!,
        '/api/client/establishment/$idEstablishment/calendar/events',
        {'date': date},
      );

      final http.Response response = await http.get(
        url,
        headers: headersToken(),
      );
      return listEventsModelFromJson(response.body);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<ListNextdateModel?> listCalendarNextdate(
      String idEstablishment, String date) async {
    try {
      final url = Uri.https(
        urlBase!,
        '/api/client/establishment/$idEstablishment/calendar/nextdate',
        {'date': date},
      );

      final http.Response response = await http.get(
        url,
        headers: headersToken(),
      );

      return listNextdateModelFromJson(response.body);
    } catch (e) {
      return null;
    }
  }
}
