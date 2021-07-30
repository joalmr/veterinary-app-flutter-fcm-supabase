import 'model/clients_model.dart';
import 'model/find_user_model.dart';

abstract class ClientsInterface {
  Future<ClientsModel> getMyCLients(String establishment);
  Future<dynamic> createBooking(String establishment, String bookingAt,
      String petId, List<int> typeId, String userId);
  Future<FindUserModel> getUser(String userId);
  Future<FindUserModel> findUser(String mailUser);
}
