import 'model/invitationModel.dart';
import 'model/workerModel.dart';
import 'model/workerModelnvitado.dart';

abstract class WorkersInterface {
  Future<WorkersModal> getWorkers(String establishmentId);
  Future<WorkersModalInvitado> getWorkersInvitado(String establishmentId);
  Future<InvitationModel> setInvita(String establishmentId, String mail);
  Future<int> deleteInvita(String establishmentId, String invitationId);
  Future<int> deleteWorker(String establishmentId, String workerId);
}
