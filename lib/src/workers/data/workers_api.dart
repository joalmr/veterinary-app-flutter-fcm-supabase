import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vet_app/config/variables_global.dart';
import 'package:vet_app/resources/utils/header_http.dart';
import 'package:vet_app/src/workers/data/model/worker_model.dart';
import 'package:vet_app/src/workers/data/model/worker_modelnvitado.dart';

import '_workers_interface.dart';
import 'model/invitation_model.dart';

class WorkersApi extends WorkersInterface {
  @override
  Future<WorkersModal> getWorkers(String establishmentId) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishmentId/workers',
    );

    final http.Response response = await http.get(url, headers: headersToken());

    return workersModalFromJson(response.body);
  }

  @override
  Future<WorkersModalInvitado> getWorkersInvitado(
      String establishmentId) async {
    final url = Uri.https(
      urlBase!,
      '/api/client/establishment/$establishmentId/worker/invitations',
    );

    final http.Response response = await http.get(
      url,
      headers: headersToken(),
    );

    return workersModalInvitadoFromJson(response.body);
  }

  @override
  Future<InvitationModel> setInvita(String establishmentId, String mail) async {
    final url = Uri.https(urlBase!,
        '/api/client/establishment/$establishmentId/worker/invitation');
    final dataBooking = {'email': mail};

    final http.Response response = await http.post(
      url,
      headers: headersToken(),
      body: jsonEncode(dataBooking),
    );

    final respuesta = invitationModelFromJson(response.body);
    return respuesta;
  }

  @override
  Future<int> deleteInvita(String establishmentId, String invitationId) async {
    final url = Uri.https(urlBase!,
        '/api/client/establishment/$establishmentId/worker/invitation/$invitationId');

    final http.Response response = await http.delete(
      url,
      headers: headersToken(),
    );

    return response.statusCode;
  }

  @override
  Future<int> deleteWorker(String establishmentId, String workerId) async {
    final url = Uri.https(urlBase!,
        '/api/client/establishment/$establishmentId/worker/$workerId');

    final http.Response response = await http.delete(
      url,
      headers: headersToken(),
    );

    return response.statusCode;
  }
}
