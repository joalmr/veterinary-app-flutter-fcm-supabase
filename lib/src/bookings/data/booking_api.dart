import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vet_app/resources/utils/header_http.dart';
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/src/bookings/data/model/_finalize_attention.dart';
import 'package:vet_app/src/bookings/data/model/booking/consultation_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/grooming_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/testing_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/others_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/vaccination_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgery_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/deworming_booking.dart';
import '_booking_interface.dart';
import 'model/booking/_general_booking.dart';
import 'model/booking_model.dart';

class BookingApi extends BookingInterface {
  @override
  Future<int> confirm(String idBooking) async {
    final url = Uri.https(urlBase!, '/api/client/booking/$idBooking/confirm');

    final http.Response response =
        await http.post(url, headers: headersToken());
    return response.statusCode;
  }

  @override
  Future<http.Response> reschedule(String idBooking, String bookingAt) async {
    final url =
        Uri.https(urlBase!, '/api/client/booking/$idBooking/reschedule');
    final dataBooking = {'booking_at': bookingAt};

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(dataBooking),
    );
    return response;
  }

  @override
  Future<GeneralBooking> attend(String establishment, String booking) async {
    final url = Uri.https(urlBase!,
        '/api/client/establishment/$establishment/booking/$booking/attend');

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
    );

    print(response.body);
    final dataResponse = generalBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<BookingModel> getId(String idBooking) async {
    final url = Uri.https(urlBase!, '/api/client/booking/$idBooking');

    final http.Response response = await http.get(
      url,
      headers: headersToken(),
    );
    return BookingModel.fromJson(json.decode(response.body));
  }

  @override
  Future<BookingModel> getUnconfirmed(String idVet) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$idVet/bookings',
      {'status': 'unconfirmed'},
    );

    final http.Response response = await http.get(url, headers: headersToken());
    return bookingModelFromJson(response.body);
  }

  @override
  Future<BookingModel> getOverdue(String idVet) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$idVet/bookings',
      {'status': 'overdue'},
    );

    final http.Response response = await http.get(url, headers: headersToken());
    return bookingModelFromJson(response.body);
  }

  @override
  Future<BookingModel> getToday(String idVet) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$idVet/bookings',
      {'status': 'today'},
    );

    final http.Response response = await http.get(url, headers: headersToken());
    return bookingModelFromJson(response.body);
  }

  @override
  Future<BookingModel> getIncoming(String idVet) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$idVet/bookings',
      {'status': 'incoming'},
    );

    final http.Response response = await http.get(url, headers: headersToken());
    return bookingModelFromJson(response.body);
  }

  @override
  Future<ConsultationBooking> saveConsultation(
      String establishment, String attention, ConsultationBooking data) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/consultation',
    );

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: consultationBookingToJson(data),
    );

    final dataResponse = consultationBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<SurgeryBooking> saveSurgery(
      String establishment, String attention, SurgeryBooking data) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/surgery',
    );

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: surgeryBookingToJson(data),
    );

    final dataResponse = surgeryBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<DewormingBooking> saveDeworming(
      String establishment, String attention, DewormingBooking data) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/deworming',
    );

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: dewormingBookingToJson(data),
    );

    final dataResponse = dewormingBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<VaccinationBooking> saveVaccination(
      String establishment, String attention, VaccinationBooking data) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/vaccination',
    );

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: vaccinationBookingToJson(data),
    );

    final dataResponse = vaccinationBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<TestingBooking> saveTesting(
      String establishment, String attention, TestingBooking data) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/testing',
    );

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: testingBookingToJson(data),
    );

    final dataResponse = testingBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<OthersBooking> saveOthers(
      String establishment, String attention, OthersBooking data) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/other',
    );

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: othersBookingToJson(data),
    );

    final dataResponse = othersBookingFromJson(response.body);
    return dataResponse;
  }

  @override
  Future<dynamic> finalizeAttention(String establishment, String attention,
      FinalizeAttention finaliza) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/finalize',
    );
    print('finaliza atencion');
    print(finalizeAttentionToJson(finaliza));
    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: finalizeAttentionToJson(finaliza),
    );

    print('finalizó');
    print(response.body);
    return jsonDecode(response.body);
  }

  @override
  Future<dynamic> deleteServiceAttention(
      String establishment, String attention, String type) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/detail',
    );
    final dataJson = {'type': type};
    final http.Response response = await http.delete(
      url,
      headers: headersToken(),
      body: jsonEncode(dataJson),
    );

    return jsonDecode(response.body);
  }

  @override
  Future<GroomingBooking?> saveGrooming(
      String establishment, String attention, GroomingBooking data) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishment/attention/$attention/grooming',
    );

    print('============> envia grooming');
    print(groomingBookingToJson(data));

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: groomingBookingToJson(data),
    );
    print('====> grooming');
    print(response.body);
    print('<==== grooming');
    final dataResponse = groomingBookingFromJson(response.body);
    return dataResponse;
    // return null;
  }
}
