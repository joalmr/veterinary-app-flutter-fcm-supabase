import 'model/booking/consultationBooking.dart';
import 'model/booking/dewormingBooking.dart';
import 'model/booking/surgeryBooking.dart';
import 'model/booking/vaccinationBooking.dart';
import 'model/bookingModel.dart';

abstract class BookingInterface {
  Future<int> confirm(String idBooking);
  Future<int> reschedule(String idBooking, String bookingAt);
  Future<dynamic> attend(String establishment, String booking);
  Future<BookingModel> getId(String idBooking);
  Future<BookingModel> getUnconfirmed(String idVet);
  Future<BookingModel> getOverdue(String idVet);
  Future<BookingModel> getToday(String idVet);
  Future<BookingModel> getIncoming(String idVet);

  Future<ConsultationBooking> saveConsultation(
      String establishment, String attention, ConsultationBooking data);
  Future<SurgeryBooking> saveSurgery(
      String establishment, String attention, SurgeryBooking data);
  Future<DewormingBooking> saveDeworming(
      String establishment, String attention, DewormingBooking data);
  Future<VaccinationBooking> saveVaccination(
      String establishment, String attention, VaccinationBooking data);
}
