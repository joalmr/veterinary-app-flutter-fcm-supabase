import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/src/workers/data/model/workerModel.dart';
import 'package:vet_app/src/workers/data/model/workerModelnvitado.dart';
import 'package:vet_app/src/workers/data/workersRepository.dart';

class WorkersController extends GetxController {
  final _repo = WorkersRepository();

  RxList<WorkerApp> workers = <WorkerApp>[].obs;
  RxList<Invitation> workersInvitation = <Invitation>[].obs;

  @override
  void onInit() {
    getWorkers();
    getInvitados();
    super.onInit();
  }

  //!   mis administradores
  //
  getWorkers() => _getWorkers();
  _getWorkers() async {
    workers.clear();
    final response = await _repo.getWorkers(prefUser.vetId);
    final lista = response.result.workers;
    print("workers");
    workers.addAll(lista);
  }

  //!   invitaciones
  //
  getInvitados() => _getInvitados();
  _getInvitados() async {
    workersInvitation.clear();
    final response = await _repo.getWorkersInvitado(prefUser.vetId);
    final lista = response.result.invitations;
    print("workers invitados");
    workersInvitation.addAll(lista);
  }

  setInvita(email) => _setInvita(email);
  _setInvita(email) async {
    await _repo.setInvita(prefUser.vetId, email);
  }

  deleteInvita(invitationId) => _deleteInvita(invitationId);
  _deleteInvita(invitationId) async {
    await _repo.deleteInvita(prefUser.vetId, invitationId);
    getInvitados();
  }
}
