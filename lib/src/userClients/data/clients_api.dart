import 'package:vet_app/config/variables_global.dart';
import 'package:http/http.dart' as http;
import 'package:vet_app/resources/utils/header_http.dart';
import '_clients_interface.dart';
import 'model/clients_model.dart';

class ClientsApi extends ClientsInterface {
  @override
  Future<ClientsModel> getMyCLients(String establishment) async {
    final url = Uri.https(
      urlBase!,
      '$pathBase/establishment/$establishment/clients',
    );

    final http.Response response = await http.get(url, headers: headersToken());

    final clients = clientsModelFromJson(response.body);

    return clients;
  }

  @override
  Future createBooking(String establishment, String bookingAt, String petId,
      List<int> typeId, String userId) async {
    print('object');
    return 'null';
  }
}
