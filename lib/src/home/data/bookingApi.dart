import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vet_app/resources/utils/headerHttp.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import '_bookingInterface.dart';
import 'model/bookingModel.dart';

class BookingApi extends BookingInterface {
  @override
  Future<int> confirm(String idBooking) async {
    final url = Uri.https(urlBase, '/api/client/booking/$idBooking/confirm');

    http.Response response = await http.post(url, headers: headersToken());

    return response.statusCode;
  }

  @override
  Future<int> reschedule(String idBooking, String bookingAt) async {
    final url = Uri.https(urlBase, '/api/client/booking/$idBooking/reschedule');
    final dataBooking = {"booking_at": bookingAt};

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: dataBooking,
    );

    return response.statusCode;
  }

  @override
  Future<BookingModel> getId(String idBooking) async {
    final url = Uri.https(urlBase, '/api/client/booking/$idBooking');

    http.Response response = await http.get(url, headers: headersToken());

    return BookingModel.fromJson(json.decode(response.body));
  }

  // @override
  // Future<List<ReservaModel>> getAll(String idVet) async {
  //   final url = Uri.https(urlBase, '/api/client/establishment/$idVet/bookings');

  //   http.Response response = await http.get(url, headers: headersToken());

  //   return List<ReservaModel>.from(
  //     json.decode(response.body).map((x) => ReservaModel.fromJson(x)),
  //   );
  // }

  @override
  Future<BookingModel> getUnconfirmed(String idVet) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$idVet/bookings',
      {"status": "unconfirmed"},
    );

    http.Response response = await http.get(url, headers: headersToken());

    return bookingModelFromJson(response.body);
  }

  @override
  Future<BookingModel> getOverdue(String idVet) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$idVet/bookings',
      {"status": "overdue"},
    );

    http.Response response = await http.get(url, headers: headersToken());

    return bookingModelFromJson(response.body);
  }

  @override
  Future<BookingModel> getToday(String idVet) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$idVet/bookings',
      {"status": "today"},
    );

    http.Response response = await http.get(url, headers: headersToken());

    return bookingModelFromJson(response.body);
  }

  @override
  Future<BookingModel> getIncoming(String idVet) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$idVet/bookings',
      {"status": "incoming"},
    );

    http.Response response = await http.get(url, headers: headersToken());

    return bookingModelFromJson(response.body);
  }
}
