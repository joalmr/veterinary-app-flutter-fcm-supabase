import 'package:vet_app/src/workers/data/model/worker_modelnvitado.dart';
import 'package:vet_app/src/workers/data/model/worker_model.dart';
import '_workers_interface.dart';
import 'model/invitation_model.dart';
import 'workers_api.dart';

class WorkersRepository extends WorkersInterface {
  final _api = WorkersApi();

  @override
  Future<WorkersModal> getWorkers(String establishmentId) {
    return _api.getWorkers(establishmentId);
  }

  @override
  Future<WorkersModalInvitado> getWorkersInvitado(String establishmentId) {
    return _api.getWorkersInvitado(establishmentId);
  }

  @override
  Future<InvitationModel> setInvita(String establishmentId, String mail) {
    return _api.setInvita(establishmentId, mail);
  }

  @override
  Future<int> deleteInvita(String establishmentId, String invitationId) {
    return _api.deleteInvita(establishmentId, invitationId);
  }

  @override
  Future<int> deleteWorker(String establishmentId, String workerId) {
    return _api.deleteWorker(establishmentId, workerId);
  }
}
