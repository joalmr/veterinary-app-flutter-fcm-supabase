import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vet_app/config/variablesGlobal.dart';
import 'package:vet_app/design/styles/styles.dart';
import 'package:vet_app/src/workers/data/model/invitation_model.dart';
import 'package:vet_app/src/workers/data/model/worker_model.dart';
import 'package:vet_app/src/workers/data/model/worker_modelnvitado.dart';
import 'package:vet_app/src/workers/data/workers_repository.dart';

class WorkersController extends GetxController {
  final _repo = WorkersRepository();

  final emailText = TextEditingController();

  RxBool carga = false.obs;
  RxList<WorkerApp> workers = <WorkerApp>[].obs;
  RxList<Invitation> workersInvitation = <Invitation>[].obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() => _init();
  _init() async {
    carga.value = true;
    await getWorkers();
    await getInvitados();
    carga.value = false;
  }

  //!   mis administradores
  //
  getWorkers() => _getWorkers();
  _getWorkers() async {
    workers.clear();
    final response = await _repo.getWorkers(prefUser.vetId!);
    final lista = response.result!.workers;
    workers.addAll(lista!);
  }

  //!   invitaciones
  //
  getInvitados() => _getInvitados();
  _getInvitados() async {
    workersInvitation.clear();
    final response = await _repo.getWorkersInvitado(prefUser.vetId!);
    final lista = response.result!.invitations;
    workersInvitation.addAll(lista!);
  }

  setInvita() => _setInvita();
  _setInvita() async {
    if (!EmailValidator.validate(emailText.text)) {
      Get.snackbar(
        'Error',
        'El formato del email es invalido',
        backgroundColor: colorRed,
        colorText: colorWhite,
      );
    } else {
      InvitationModel value =
          await _repo.setInvita(prefUser.vetId!, emailText.text);
      if (!value.result!) {
        Get.snackbar(
          'Error',
          value.message!,
          backgroundColor: colorRed,
          colorText: colorWhite,
        );
      } else {
        emailText.clear();
        getInvitados();
      }
    }
  }

  deleteInvita(invitationId) => _deleteInvita(invitationId);
  _deleteInvita(invitationId) async {
    await _repo.deleteInvita(prefUser.vetId!, invitationId);
    getInvitados();
  }

  deleteWorker(workerId) => _deleteWorker(workerId);
  _deleteWorker(workerId) async {
    await _repo.deleteWorker(prefUser.vetId!, workerId);
    getInvitados();
  }
}
