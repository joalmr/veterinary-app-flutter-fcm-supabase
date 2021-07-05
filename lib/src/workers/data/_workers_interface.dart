import 'model/invitation_model.dart';
import 'model/worker_model.dart';
import 'model/worker_modelnvitado.dart';

abstract class WorkersInterface {
  Future<WorkersModal> getWorkers(String establishmentId);
  Future<WorkersModalInvitado> getWorkersInvitado(String establishmentId);
  Future<InvitationModel> setInvita(String establishmentId, String mail);
  Future<int> deleteInvita(String establishmentId, String invitationId);
  Future<int> deleteWorker(String establishmentId, String workerId);
}
