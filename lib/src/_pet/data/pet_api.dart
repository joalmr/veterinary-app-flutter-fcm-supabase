import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/header_http.dart';
import 'package:vet_app/src/_pet/model/pet_client.dart';
import 'package:vet_app/src/_pet/model/pet_client_history.dart';

import '_pet_interface.dart';

import 'package:http/http.dart' as http;

class PetClientApi extends PetClientInterface {
  @override
  Future<PetClient> getPet(String petId) async {
    print(petId);
    final url = Uri.https(urlBase!, '/api/client/pet/$petId');

    final http.Response response = await http.get(
      url,
      headers: headersToken(),
    );

    print(response.statusCode);
    print(response.body);
    final petResponse = petClientFromJson(response.body);

    return petResponse;
  }

  @override
  Future<PetClientHistory> getPetHistory(String petId) async {
    final url = Uri.https(urlBase!, '/api/client/pet/$petId/history');

    final http.Response response = await http.get(
      url,
      headers: headersToken(),
    );

    final petResponse = petClientHistoryFromJson(response.body);

    return petResponse;
  }
}
