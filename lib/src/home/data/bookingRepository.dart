import 'bookingApi.dart';
import '_bookingInterface.dart';
import 'model/bookingModel.dart';
import 'model/reservaModel.dart';

class BookingRepository extends BookingInterface {
  final _api = BookingApi();

  @override
  Future<int> confirm(String idBooking) {
    return _api.confirm(idBooking);
  }

  @override
  Future<List<ReservaModel>> getAll(String idVet) {
    return _api.getAll(idVet);
  }

  @override
  Future<ReservaModel> getId(String idBooking) {
    return _api.getId(idBooking);
  }

  @override
  Future<int> reschedule(String idBooking, String bookingAt) {
    return _api.reschedule(idBooking, bookingAt);
  }

  @override
  Future<List<ResultBooking>> getIncoming(String idVet) {
    return _api.getIncoming(idVet);
  }

  @override
  Future<List<ResultBooking>> getOverdue(String idVet) {
    return _api.getOverdue(idVet);
  }

  @override
  Future<List<ResultBooking>> getToday(String idVet) {
    return _api.getToday(idVet);
  }

  @override
  Future<List<ResultBooking>> getUnconfirmed(String idVet) {
    return _api.getUnconfirmed(idVet);
  }
}
