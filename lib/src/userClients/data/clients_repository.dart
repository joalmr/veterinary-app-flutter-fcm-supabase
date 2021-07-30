import '_clients_interface.dart';
import 'clients_api.dart';
import 'model/clients_model.dart';
import 'model/find_user_model.dart';

class ClientsRepository extends ClientsInterface {
  final _api = ClientsApi();

  @override
  Future<ClientsModel> getMyCLients(String establishment) {
    return _api.getMyCLients(establishment);
  }

  @override
  Future<dynamic> createBooking(String establishment, String bookingAt,
      String petId, List<int> typeId, String userId) {
    return _api.createBooking(establishment, bookingAt, petId, typeId, userId);
  }

  @override
  Future<FindUserModel> findUser(String mailUser) {
    return _api.findUser(mailUser);
  }

  @override
  Future<FindUserModel> getUser(String userId) {
    return _api.getUser(userId);
  }
}
