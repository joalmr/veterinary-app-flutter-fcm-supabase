import 'model/workerModel.dart';
import 'model/workerModelnvitado.dart';

abstract class WorkersInterface {
  Future<List<WorkersModal>> getWorkers(String establishmentId);
  Future<List<WorkersModalInvitado>> getWorkersInvitado(String establishmentId);
  Future<int> setInvita(String establishmentId, String mail);
  Future<int> deleteInvita(String establishmentId, String invitationId);
}
