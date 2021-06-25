import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vet_app/resources/utils/headerHttp.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/bookings/data/model/booking/consultationBooking.dart';
import 'package:vet_app/src/bookings/data/model/booking/testingBooking.dart';
import 'package:vet_app/src/bookings/data/model/booking/othersBooking.dart';
import 'package:vet_app/src/bookings/data/model/booking/vaccinationBooking.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgeryBooking.dart';
import 'package:vet_app/src/bookings/data/model/booking/dewormingBooking.dart';
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
      body: jsonEncode(dataBooking),
    );
    return response.statusCode;
  }

  @override
  Future<dynamic> attend(String establishment, String booking) async {
    final url = Uri.https(urlBase,
        '/api/client/establishment/$establishment/booking/$booking/attend');

    http.Response response = await http.post(url, headers: headersToken());
    // print(response.body);
    return response.body;
  }

  @override
  Future<BookingModel> getId(String idBooking) async {
    final url = Uri.https(urlBase, '/api/client/booking/$idBooking');

    http.Response response = await http.get(url, headers: headersToken());
    return BookingModel.fromJson(json.decode(response.body));
  }

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

  @override
  Future<ConsultationBooking> saveConsultation(
      String establishment, String attention, ConsultationBooking data) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$establishment/attention/$attention/consultation',
    );

    print(consultationBookingToJson(data));

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: consultationBookingToJson(data),
    );

    print(response.statusCode);
    print(response.body);
    final dataResponse = consultationBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<SurgeryBooking> saveSurgery(
      String establishment, String attention, SurgeryBooking data) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$establishment/attention/$attention/surgery',
    );

    print(surgeryBookingToJson(data));

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: surgeryBookingToJson(data),
    );

    print(response.statusCode);
    print(response.body);
    final dataResponse = surgeryBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<DewormingBooking> saveDeworming(
      String establishment, String attention, DewormingBooking data) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$establishment/attention/$attention/deworming',
    );

    print(dewormingBookingToJson(data));

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: dewormingBookingToJson(data),
    );

    print(response.statusCode);
    print(response.body);
    final dataResponse = dewormingBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<VaccinationBooking> saveVaccination(
      String establishment, String attention, VaccinationBooking data) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$establishment/attention/$attention/surgery',
    );

    print(vaccinationBookingToJson(data));

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: vaccinationBookingToJson(data),
    );

    print(response.statusCode);
    print(response.body);
    final dataResponse = vaccinationBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<TestingBooking> saveTesting(
      String establishment, String attention, TestingBooking data) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$establishment/attention/$attention/testing',
    );

    print(testingBookingToJson(data));

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: testingBookingToJson(data),
    );

    print(response.statusCode);
    print(response.body);
    final dataResponse = testingBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<OthersBooking> saveOthers(
      String establishment, String attention, OthersBooking data) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$establishment/attention/$attention/other',
    );

    print(othersBookingToJson(data));

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: othersBookingToJson(data),
    );

    print(response.statusCode);
    print(response.body);
    final dataResponse = othersBookingFromJson(response.body);
    return dataResponse;
  }
}
