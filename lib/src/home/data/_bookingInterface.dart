import 'model/bookingModel.dart';

abstract class BookingInterface {
  Future<List<ReservaModel>> getAll(String idVet);
  Future<ReservaModel> getId(String idBooking);
  Future<int> confirm(String idBooking);
  Future<int> reschedule(String idBooking, String bookingAt);
}
