import 'model/clients_model.dart';

abstract class ClientsInterface {
  Future<ClientsModel> getMyCLients(String establishment);
  Future<dynamic> createBooking(String establishment, String bookingAt,
      String petId, List<int> typeId, String userId);
}
