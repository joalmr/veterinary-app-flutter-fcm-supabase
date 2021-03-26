import '_bookingInterface.dart';
import 'bookingApi.dart';
import 'model/bookingModel.dart';

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
}
