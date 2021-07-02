import 'dart:convert';

import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/resources/utils/headerHttp.dart';
import 'package:vet_app/src/workers/data/model/workerModelnvitado.dart';
import 'package:vet_app/src/workers/data/model/workerModel.dart';
import '_workersInterface.dart';
import 'package:http/http.dart' as http;

import 'model/invitationModel.dart';

class WorkersApi extends WorkersInterface {
  @override
  Future<WorkersModal> getWorkers(String establishmentId) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishmentId/workers',
    );

    http.Response response = await http.get(url, headers: headersToken());

    return workersModalFromJson(response.body);
  }

  @override
  Future<WorkersModalInvitado> getWorkersInvitado(
      String establishmentId) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishmentId/worker/invitations',
    );

    http.Response response = await http.get(url, headers: headersToken());

    return workersModalInvitadoFromJson(response.body);
  }

  @override
  Future<InvitationModel> setInvita(String establishmentId, String mail) async {
    final url = Uri.https(urlBase!,
        '/api/client/establishment/$establishmentId/worker/invitation');
    final dataBooking = {"email": mail};

    http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(dataBooking),
    );
    print(response.body);
    var respuesta = invitationModelFromJson(response.body);
    return respuesta;
  }

  @override
  Future<int> deleteInvita(String establishmentId, String invitationId) async {
    final url = Uri.https(urlBase!,
        '/api/client/establishment/$establishmentId/worker/invitation/$invitationId');

    http.Response response = await http.delete(
      url,
      headers: headersToken(),
    );
    print(response.statusCode);
    print(response.body);
    return response.statusCode;
  }

  @override
  Future<int> deleteWorker(String establishmentId, String workerId) async {
    final url = Uri.https(urlBase!,
        '/api/client/establishment/$establishmentId/worker/$workerId');

    http.Response response = await http.delete(
      url,
      headers: headersToken(),
    );
    print(response.statusCode);
    print(response.body);
    return response.statusCode;
  }
}
