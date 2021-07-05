import 'model/_finalizeAttention.dart';
import 'model/booking/_generalBooking.dart';
import 'model/booking/consultationBooking.dart';
import 'model/booking/dewormingBooking.dart';
import 'model/booking/othersBooking.dart';
import 'model/booking/surgeryBooking.dart';
import 'model/booking/testingBooking.dart';
import 'model/booking/vaccinationBooking.dart';
import 'model/bookingModel.dart';

import 'package:http/http.dart' as http;

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
  Future<void> finalizeAttention(
      String establishment, String attention, FinalizeAttention finaliza);
}
