import 'package:vet_app/src/home/data/model/bookingModel.dart';

import 'model/reservaModel.dart';

abstract class BookingInterface {
  Future<int> confirm(String idBooking);
  Future<int> reschedule(String idBooking, String bookingAt);
  Future<ReservaModel> getId(String idBooking);
  Future<List<ReservaModel>> getAll(String idVet);
  Future<List<ResultBooking>> getUnconfirmed(String idVet);
  Future<List<ResultBooking>> getOverdue(String idVet);
  Future<List<ResultBooking>> getToday(String idVet);
  Future<List<ResultBooking>> getIncoming(String idVet);
}
