import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/workers/data/model/invitationModel.dart';
import 'package:vet_app/src/workers/data/model/workerModel.dart';
import 'package:vet_app/src/workers/data/model/workerModelnvitado.dart';
import 'package:vet_app/src/workers/data/workersRepository.dart';

class WorkersController extends GetxController {
  final _repo = WorkersRepository();

  RxBool carga=false.obs;
  RxList<WorkerApp> workers = <WorkerApp>[].obs;
  RxList<Invitation> workersInvitation = <Invitation>[].obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init()=>_init();
  _init() async {
    carga.value=true;
    await getWorkers();
    await getInvitados();
    carga.value=false;
  }
  //!   mis administradores
  //
  getWorkers() => _getWorkers();
  _getWorkers() async {
    workers.clear();
    final response = await _repo.getWorkers(prefUser.vetId);
    final lista = response.result.workers;
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
    print('send mail');
    print(prefUser.vetId);
    print(email);
    InvitationModel value = await _repo.setInvita(prefUser.vetId, email);
    print(value.result);
    if(!value.result){
      Get.snackbar('Error', value.message,backgroundColor: colorRed);
    }
    else{
      getInvitados();
    }
  }

  deleteInvita(invitationId) => _deleteInvita(invitationId);
  _deleteInvita(invitationId) async {
    await _repo.deleteInvita(prefUser.vetId, invitationId);
    getInvitados();
  }
}
