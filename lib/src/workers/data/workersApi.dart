import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/headerHttp.dart';
import 'package:vet_app/src/workers/data/model/workerModelnvitado.dart';
import 'package:vet_app/src/workers/data/model/workerModel.dart';
import '_workersInterface.dart';
import 'package:http/http.dart' as http;

class WorkersApi extends WorkersInterface {
  @override
  Future<List<WorkersModal>> getWorkers(String establishmentId) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$establishmentId/workers',
    );

    http.Response response = await http.get(url, headers: headersToken());

    return workersModalFromJson(response.body);
  }

  @override
  Future<List<WorkersModalInvitado>> getWorkersInvitado(
      String establishmentId) async {
    final url = Uri.https(
      urlBase,
      '/api/client/establishment/$establishmentId/worker/invitations',
    );

    http.Response response = await http.get(url, headers: headersToken());

    return workersModalInvitadoFromJson(response.body);
  }

  @override
  Future<int> setInvita(String establishmentId, String mail) async {
    final url = Uri.https(urlBase,
        '/api/client/establishment/$establishmentId/worker/invitation');
    final dataBooking = {"email": mail};

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: dataBooking,
    );

    return response.statusCode;
  }

  @override
  Future<int> deleteInvita(String establishmentId, String invitationId) async {
    final url = Uri.https(urlBase,
        '/api/client/establishment/$establishmentId/worker/invitation/$invitationId');

    http.Response response = await http.delete(
      url,
      headers: headersToken(),
    );

    return response.statusCode;
  }
}
