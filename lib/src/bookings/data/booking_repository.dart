import 'package:http/http.dart' as http;
import 'package:vet_app/src/bookings/data/model/_finalize_attention.dart';
import 'package:vet_app/src/bookings/data/model/booking/consultation_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/deworming_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/grooming_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/others_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/surgery_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/testing_booking.dart';
import 'package:vet_app/src/bookings/data/model/booking/vaccination_booking.dart';

import '_booking_interface.dart';
import 'booking_api.dart';
import 'model/booking/_general_booking.dart';
import 'model/booking_model.dart';

class BookingRepository extends BookingInterface {
  final _api = BookingApi();

  @override
  Future<int> confirm(String idBooking) {
    return _api.confirm(idBooking);
  }

  @override
  Future<http.Response> reschedule(String idBooking, String bookingAt) {
    return _api.reschedule(idBooking, bookingAt);
  }

  @override
  Future<GeneralBooking> attend(String establishment, String booking) {
    return _api.attend(establishment, booking);
  }

  @override
  Future<BookingModel> getId(String idBooking) {
    return _api.getId(idBooking);
  }

  @override
  Future<BookingModel> getIncoming(String idVet) {
    return _api.getIncoming(idVet);
  }

  @override
  Future<BookingModel> getOverdue(String idVet) {
    return _api.getOverdue(idVet);
  }

  @override
  Future<BookingModel> getToday(String idVet) {
    return _api.getToday(idVet);
  }

  @override
  Future<BookingModel> getUnconfirmed(String idVet) {
    return _api.getUnconfirmed(idVet);
  }

  @override
  Future<ConsultationBooking> saveConsultation(
      String establishment, String attention, ConsultationBooking data) {
    return _api.saveConsultation(establishment, attention, data);
  }

  @override
  Future<DewormingBooking> saveDeworming(
      String establishment, String attention, DewormingBooking data) {
    return _api.saveDeworming(establishment, attention, data);
  }

  @override
  Future<SurgeryBooking> saveSurgery(
      String establishment, String attention, SurgeryBooking data) {
    return _api.saveSurgery(establishment, attention, data);
  }

  @override
  Future<VaccinationBooking> saveVaccination(
      String establishment, String attention, VaccinationBooking data) {
    return _api.saveVaccination(establishment, attention, data);
  }

  @override
  Future<OthersBooking> saveOthers(
      String establishment, String attention, OthersBooking data) {
    return _api.saveOthers(establishment, attention, data);
  }

  @override
  Future<TestingBooking> saveTesting(
      String establishment, String attention, TestingBooking data) {
    return _api.saveTesting(establishment, attention, data);
  }

  @override
  Future<dynamic> finalizeAttention(
      String establishment, String attention, FinalizeAttention finaliza) {
    return _api.finalizeAttention(establishment, attention, finaliza);
  }

  @override
  Future deleteServiceAttention(
      String establishment, String attention, String type) {
    return _api.deleteServiceAttention(establishment, attention, type);
  }

  @override
  Future<GroomingBooking?> saveGrooming(
      String establishment, String attention, GroomingBooking data) {
    return _api.saveGrooming(establishment, attention, data);
  }
}
