import 'package:http/http.dart' as http;

import 'model/_finalize_attention.dart';
import 'model/booking/_general_booking.dart';
import 'model/booking/consultation_booking.dart';
import 'model/booking/deworming_booking.dart';
import 'model/booking/others_booking.dart';
import 'model/booking/surgery_booking.dart';
import 'model/booking/testing_booking.dart';
import 'model/booking/vaccination_booking.dart';
import 'model/booking_model.dart';

abstract class BookingInterface {
  Future<int> confirm(String idBooking);
  Future<http.Response> reschedule(String idBooking, String bookingAt);
  Future<GeneralBooking> attend(String establishment, String booking);
  Future<BookingModel> getId(String idBooking);
  Future<BookingModel> getUnconfirmed(String idVet);
  Future<BookingModel> getOverdue(String idVet);
  Future<BookingModel> getToday(String idVet);
  Future<BookingModel> getIncoming(String idVet);
  //
  Future<ConsultationBooking> saveConsultation(
      String establishment, String attention, ConsultationBooking data);
  Future<SurgeryBooking> saveSurgery(
      String establishment, String attention, SurgeryBooking data);
  Future<DewormingBooking> saveDeworming(
      String establishment, String attention, DewormingBooking data);
  Future<VaccinationBooking> saveVaccination(
      String establishment, String attention, VaccinationBooking data);
  Future<TestingBooking> saveTesting(
      String establishment, String attention, TestingBooking data);
  Future<OthersBooking> saveOthers(
      String establishment, String attention, OthersBooking data);
  //
  Future<dynamic> finalizeAttention(
      String establishment, String attention, FinalizeAttention finaliza);
}
