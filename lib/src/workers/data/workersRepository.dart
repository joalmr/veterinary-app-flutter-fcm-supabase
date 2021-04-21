import 'package:vet_app/src/workers/data/model/workerModelnvitado.dart';
import 'package:vet_app/src/workers/data/model/workerModel.dart';
import '_workersInterface.dart';
import 'workersApi.dart';

class WorkersRepository extends WorkersInterface {
  final _api = WorkersApi();

  @override
  Future<List<WorkersModal>> getWorkers(String establishmentId) {
    return _api.getWorkers(establishmentId);
  }

  @override
  Future<List<WorkersModalInvitado>> getWorkersInvitado(
      String establishmentId) {
    return _api.getWorkersInvitado(establishmentId);
  }

  @override
  Future<int> setInvita(String establishmentId, String mail) {
    return _api.setInvita(establishmentId, mail);
  }

  @override
  Future<int> deleteInvita(String establishmentId, String invitationId) {
    return _api.deleteInvita(establishmentId, invitationId);
  }
}
